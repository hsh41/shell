#! /bin/bash

a=123
echo $a
b="ab c  d"
echo $b
echo "$b"
echo '$b'
echo $a\_$b

echo chapter4.2
a=1+1
echo $a
let a=1+1
echo $a
a=b
echo $a
a=$b
echo $a
echo "len of string"
string="abcd"
echo ${#string}
echo "slice"
a="0123456789"
echo ${a:4:2}

a=1234567890
echo ${a:9:1}
