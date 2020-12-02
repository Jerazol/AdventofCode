#!/bin/bash
# ./validate.sh | wc -l

IFS=$'\n'
for i in $(cat input); do
  rule=$(echo $i | cut -f1 -d':' | xargs)
  search_char=$(echo $rule | cut -f2 -d' ')
  positions=$(echo $rule | cut -f1 -d' ')
  pos1=$(echo $positions | cut -f1 -d'-')
  pos1=$(($pos1-1))
  pos2=$(echo $positions | cut -f2 -d'-')
  pos2=$(($pos2-1))
  passwd=$(echo $i | cut -f2 -d':' | xargs)

  charat_pos1=${passwd:$pos1:1}
  charat_pos2=${passwd:$pos2:1}

  if [[ ! (("$search_char" == "$charat_pos1" && "$search_char" != "$charat_pos2") || ("$search_char" != "$charat_pos1" && "$search_char" == "$charat_pos2")) ]]
  then
    echo "Invalid password: ${passwd} ( ${i} )"
  fi
done
