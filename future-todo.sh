#!/bin/bash
#script to future todo files.

DATE=$1
if [ -z $DATE ]
then
  echo "no date"
  exit 1
fi
DEFAULTFILE="${DATE}.md"
FILE="future/$DEFAULTFILE"

if [ -e $FILE ]
then
  echo "file already exists"
  vi $FILE
else
  echo "#### $DATE ####" > $FILE
  echo "" >> $FILE
  git add $FILE
  git commit $FILE -m "future todo for $DATE"
  vi $FILE
fi
