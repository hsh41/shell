#!/bin/bash

logdir="summary"
port=8008
if [ $# -eq 1 ]; then
    logir=$1
fi

if [ $# -eq 2 ]; then
    logdir=$1
    port=$2
fi
ps -u |grep tensorboard|grep -v grep|awk '{print$2}'|xargs kill > /dev/null 2>&1
tensorboard --logdir=${logdir} --port=${port}
