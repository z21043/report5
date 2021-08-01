#!/bin/sh


first=$1
second=$2

#引数の数をチェック
if [ $# != 2 ]; then
	echo "引数の数が正しくありません"
	exit 1
fi


#引数が自然数かチェック(引数1つ目)
if 
	expr "$first" : "[0-9]*$" > /dev/null; then :
else
	echo "引数が自然数ではありません"
	exit 1
fi

#引数が自然数かチェック(引数２つ目)
if 
        expr "$second" : "[0-9]*$" > /dev/null; then :
else    
        echo "引数が自然数ではありません"
        exit 1
fi

#最大公約数を求める
while [ 0 -lt $second ]
do

        amari=`expr $first % $second`
	first=$second
	second=$amari
done
echo "最大公約数:　"$first

