#!/bin/bash
CURRENTDATE=`date +"%Y-%m-%d-%H%M"`
CURRENTDATEONLY=`date +"%b %d, %Y"`
CURRENTEPOCTIME=`date +"Y-%m-%d %T"`
echo Current Date is: ${CURRENTDATEONLY}
echo Current Date and Time is: `date +"%Y-%m-%d %T"`
printf "Current Date and Time is: ${CURRENTDATE}\n"
printf "file${CURRENTDATE}\n"

for CFG_FILE in install_zsh.sh
do
    if [ -f ${CFG_FILE} ]; then
        cp ${CFG_FILE} ${CFG_FILE}."bak".${CURRENTDATE}
        printf ${CFG_FILE}"\n"
    fi
done

