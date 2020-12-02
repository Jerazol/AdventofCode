#!/bin/bash
# ./validate.sh | wc -l

IFS=$'\n'
for i in $(cat input); do
  rule=$(echo $i | cut -f1 -d':' | xargs)
  search_char=$(echo $rule | cut -f2 -d' ')
  search_len=$(echo $rule | cut -f1 -d' ')
  min=$(echo $search_len | cut -f1 -d'-')
  max=$(echo $search_len | cut -f2 -d'-')
  passwd=$(echo $i | cut -f2 -d':' | xargs)
  orig_len=$(echo $passwd | wc -m)
  passwd2=$(echo $passwd | tr -d $search_char)
  new_len=$(echo $passwd2 | wc -m)
  num_chars=$(($orig_len-$new_len))

  if (( $num_chars < $min || $num_chars > $max ))
  then
    echo "Invalid password: ${passwd} ( ${i} )"
  fi
done
