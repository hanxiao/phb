#!/bin/bash
INFO=$(curl "https://www.quantopian.com/leaderboard/csv?month=5&year=2015" -k | grep 54e6ddde2fd828013a000173)
TIME=`date +%Y年%m月%d日%H:%M:%S`
echo "$TIME $INFO" >> history-performance.txt
VAL1=$(echo $INFO | awk -F "\"*,\"*" '{print $8}' | awk '{printf "%.2f%%", 100*$0}')
VAL2=$(echo $INFO | awk -F "\"*,\"*" '{print $12}'| awk '{printf "%.2f", $0}')
VAL3=$(echo $INFO | awk -F "\"*,\"*" '{print $14}'| awk '{printf "%.2f%%", 100*$0}')
echo "return:$VAL1"
echo "sharpe:$VAL2"
echo "drawdown:$VAL3"
sed -i -e "s/>上次更新：.*</>上次更新：$TIME</g" "_includes/portfolio_grid.html"
sed -i -e "s/<h4 v1>.*<\/h4>/<h4 v1>$VAL1<\/h4>/g" "_includes/portfolio_grid.html"
sed -i -e "s/<h4 v2>.*<\/h4>/<h4 v2>$VAL2<\/h4>/g" "_includes/portfolio_grid.html"
sed -i -e "s/<h4 v3>.*<\/h4>/<h4 v3>$VAL3<\/h4>/g" "_includes/portfolio_grid.html"
