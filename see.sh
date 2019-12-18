#!/bin/bash

if [ $# -eq 1 ]; then
    IDX=$1
else
    IDX=1
fi

vim `ls|head -${IDX}|tail -1`
