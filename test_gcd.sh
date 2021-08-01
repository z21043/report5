#!/bin/bash

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"


#エラーメッセージ用関数
ERROR(){
	echo $1 >> ${err}
}


#引数の数
echo "引数の数が正しくありません" > ${ans}
./gcd.sh 1 2 3 > ${result}
diff ${ans} ${result} || ERROR "-引数が異なる場合の出力結果を確認してください"  


#引数：小数点
echo "引数が自然数ではありません" > ${ans}
./gcd.sh 1.1 2.2 > ${result}
diff ${ans} ${result} || ERROR "-引数に小数点が含まれた場合の出力結果を確認してください"


#引数：負数
echo "引数が自然数ではありません" > ${ans}
./gcd.sh -1 -2 > ${result}
diff ${ans} ${result} || ERROR "-引数に負数が含まれた場合の出力結果を確認してください"


#引数：文字
echo "引数が自然数ではありません" > ${ans}
./gcd.sh a あ > ${result}
diff ${ans} ${result} || ERROR "-引数に文字が含まれた場合の出力結果を確認してください" 


#ログに記録があれば内容をまとめて出力
if [ -f ${err} ]; then
	echo
	echo "＊＊＊確認ポイント＊＊＊"
	cat ${err}
	rm /tmp/$$-*
	exit 1
fi



#後処理
rm /tmp/$$-*
echo "正常終了しました!"
