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
serverless invoke --function first
END=$(date +%s.%N)
DIFF2=$(echo "$END - $START" | bc)
echo Time Could Start $i:
echo $DIFF2
echo -----------------------------------------------------------------------
echo Warm Start
START=$(date +%s.%N)
serverless invoke --function first
END=$(date +%s.%N)
DIFF3=$(echo "$END - $START" | bc)
echo Time Warm Start $i:
echo $DIFF3
echo -----------------------------------------------------------------------
echo $DIFF1"\t"$DIFF2"\t"$DIFF3 >> result.txt
echo Remove Function
serverless remove

done
