#!/bin/sh
#
# 
#
#
Pathing="$@"
if Filelist=`ls $Pathing*.txt 2>"$Pathing"redact-error.log`; then
  for file in $Filelist
  do
    sed  -e 's/@[A-Za-z0-9]\{2,8\}\..\{2,3\}/@REDACTEDEMAIL\.ADDRESS/g' $file > $file.tmp && mv $file.tmp $file
  done
else    
  echo "No files found!!";
fi
