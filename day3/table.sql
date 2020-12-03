CREATE TABLE trees (
  line SERIAL,
  pattern CHAR(31)
);

\copy trees (pattern) FROM input_actual

CREATE OR REPLACE FUNCTION hits(integer, integer) RETURNS bigint
  AS $$
    SELECT  count(*) 
    FROM    (
      SELECT   SUBSTRING(
                 REPEAT(pattern, (SELECT (max(line)*($1+1))/31 FROM trees)),
                 (((line-1)*$1/$2)+1),
                 1
               ) AS field
      FROM     trees
      WHERE ((line-1)%$2) = 0
      ORDER BY line
    ) AS track
    WHERE field='#'
  $$
  LANGUAGE SQL
  IMMUTABLE
  RETURNS NULL ON NULL INPUT;

SELECT hits(3,1);

SELECT hits(1,1)*hits(3,1)*hits(5,1)*hits(7,1)*hits(1,2);



