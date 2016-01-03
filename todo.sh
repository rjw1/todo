#!/bin/bash
#script to generate a daily todo file.
#adds things from previous file that werent done.
DATE=`date +%Y-%m-%d`
DEFAULTFILE="${DATE}.md"
FILE=${1:-$DEFAULTFILE}

if [ -e $FILE ]
then
  echo "file already exists"
  vi $FILE
else
  cat future/$DEFAULTFILE | grep "^-" | grep -v "~~" >> $FILE
  cat `ls -1 ????-??-??.md | grep -v "$DATE" |tail -1 ` | grep -v "~~"  >> $FILE
  sed -i "1s/^.*$/#### $DATE ####/" $FILE
  git add $FILE
  git commit $FILE -m "todo for $DATE"
  vi $FILE
fi
