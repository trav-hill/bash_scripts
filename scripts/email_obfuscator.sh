#!/bin/sh
#
# 
#
#
Pathing="$@"
Filelist=`ls $Pathing*.txt`
for file in $Filelist
do
  sed  -e 's/@[A-Za-z0-9]\{2,8\}\..\{2,3\}/@REDACTEDEMAIL\.ADDRESS/g' $file > $file.tmp && cp $file.tmp $file
done
