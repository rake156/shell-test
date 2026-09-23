#!bin/bash
#TIMESTAMP=$(DATE)
#echo "time is: $TIMESTAMP"

start_time=$(date +%s)
sleep 10
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME - $start_time))
echo "script execution time is: $TOTAL_TIME seconds"