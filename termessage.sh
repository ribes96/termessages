#!/bin/bash

#Path to the directory containting the messages

path='files'

# Possible output colors. Used in last 'printf'
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

numfiles=`ls $path | wc -l`
randnum=`expr $RANDOM % $numfiles`
content=""
for i in `ls $path`
do
	if [ $randnum -eq 0 ]
	then
		content=`cat $path/$i`
		break
	else
		randnum=$(($randnum-1))
	fi
done

numcols=`tput cols`
numchars=${#content}
if [ $numchars -lt $numcols ]
then
	spaces=$((($numcols - $numchars)/2))
	for i in $(seq 1 $spaces)
	do
		printf " "
	done
	printf "$BYellow$content\n"
fi
