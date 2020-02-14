#! /bin/bash
if [ $# -eq 0 ]; then
    echo "You must enter a PID"
else
    for PID in $@
    do
        ps -aux|grep $PID|grep -v 'grep'|grep -v 'whose'
    done
fi
