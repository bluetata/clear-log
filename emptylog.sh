#!/bin/bash
#变量赋值等于号两边不能有空格
FILE_PATH=/usr/local/log/console.log

#if判断条件前后一定要有空格，如果写成一行（适用于终端命令提示符）要有; then
if [ -f $FILE_PATH ]
then
    #表达式一定要用``括起来，原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
    #expr 是一款表达式计算工具，使用它能完成表达式的求值操作
    #表达式和运算符之间要有空格，例如 1+1 是不对的，必须写成 1 + 1
    FILE_SIZE=`stat -c %s $FILE_PATH`
    #除法(/)
    FILE_SIZE2MB=`expr $FILE_SIZE / 1024 / 1024`
    #打印文件大小，以KB和MB形式显示
    echo $FILE_PATH文件大小为：[$FILE_SIZE]Byte, [$FILE_SIZE2MB]MB
    #乘法(\*)
    THRESHOLD=`expr 1 \* 1024 \* 1024 \* 512`

    if [ $FILE_SIZE -gt $THRESHOLD ]
    then
        echo 大于阈值：$THRESHOLD，开始清空
        #echo -n 无空行
        echo -n "" > $FILE_PATH
        #echo后的字符串可以带""也可以不用
        echo "清空成功"
    fi
else
    echo $FILE_PATH文件不存在
fi
