#!/bin/bash
#script to generate a daily todo file.
#adds things from previous file that werent done.
DATE=`date +%Y-%m-%d`
FILE=${DATE}.md
echo "#### $DATE ####" > $FILE
echo "" >> $FILE
cat `ls -tr *md | grep -v "$DATE" |tail -1 `| grep "^-" | grep -v "~~" >> $FILE
