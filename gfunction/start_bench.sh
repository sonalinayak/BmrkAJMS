#set iterations
for i in $(seq 1 1)
do
echo -----------------------------------------------------------------------
echo Serverless Deploy
START=$(date +%s.%N)
serverless deploy
END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo Time Serverless-Deploy $i:
echo $DIFF
echo -----------------------------------------------------------------------
echo Could Start
START=$(date +%s.%N)
serverless invoke --function first
END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo Time Could Start $i:
echo $DIFF
echo -----------------------------------------------------------------------
echo Warm Start
START=$(date +%s.%N)
serverless invoke --function first
END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo Time Warm Start $i:
echo $DIFF
echo -----------------------------------------------------------------------
echo Remove Function
serverless remove

done
