#!/usr/bin/env bash
# set login credentials for AWS
export AWS_ACCESS_KEY_ID=#TODO
export AWS_SECRET_ACCESS_KEY=#TODO

echo Benchmark AWS Lambda

#set iterations
for i in $(seq 1 1)
do
echo -----------------------------------------------------------------------
echo Serverless Deploy
START=$(date +%s.%N)
serverless deploy
END=$(date +%s.%N)
DIFF1=$(echo "$END - $START" | bc)
echo Time Serverless-Deploy $i:
echo $DIFF1
echo -----------------------------------------------------------------------
echo Could Start
START=$(date +%s.%N)
serverless invoke --function hello
END=$(date +%s.%N)
DIFF2=$(echo "$END - $START" | bc)
echo Time Could Start $i:
echo $DIFF2
echo -----------------------------------------------------------------------
echo Warm Start
START=$(date +%s.%N)
serverless invoke --function hello
END=$(date +%s.%N)
DIFF3=$(echo "$END - $START" | bc)
echo Time Warm Start $i:
echo $DIFF3
echo -----------------------------------------------------------------------
echo $DIFF1"\t"$DIFF2"\t"$DIFF3 >> result.txt
echo Remove Function
serverless remove

done

echo Benchmark finish...
