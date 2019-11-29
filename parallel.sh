# !/bin/bash

for i in {1..10}
do
	echo $i
done
echo "------end------"

for i in {1..10}
do
	echo $i &&
	echo $i+1 &
done
echo "------end------"

for i in {1..10}
do
	echo $i &
done
wait
echo "------end------"

beginTime=`date +%s`
num=2
# for i in `seq 1 $num`
for i in `seq 1 ${num}`
do
	{	
       	echo $i  "业务逻辑 开始执行,当前时间:" `date "+%Y-%m-%d %H:%M:%S"`
		sleep 2s
		echo $i  "业务逻辑 执行完成,当前时间:" `date "+%Y-%m-%d %H:%M:%S"`
		echo "-----------------------------------------------------------"
	# 结尾的&确保每个进程后台执行
	}&
done
# wait关键字确保每一个子进程都执行完成
wait
endTime=`date +%s`
echo "总共耗时:" $(($endTime-$beginTime)) "秒"


