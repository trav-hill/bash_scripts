#!/bin/sh
# 
# createdby: Travis Hill
#
# Simple list display exercise
i=1
test_list="$@"
for names in $test_list
do
 echo "value $((i++)) :  $names"
done
