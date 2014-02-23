#!/bin/bash
# 
# createdby: Travis Hill
#
# Simple list display exercise
i=1
test_list="$@"
if [ "$test_list" == "" ];
  then
    echo "No list entries rec'd. Exiting..."
else
  for names in $test_list
    do
      echo "value $((i++)) :  $names"
    done
fi
