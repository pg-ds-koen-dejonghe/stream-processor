#!/usr/bin/env bash

bin/stop.sh

sbt assembly
if [ $? -ne 0 ]
then
    exit
fi

spark-submit --class greendash.spark.SensorStreamProcessor target/scala-2.10/green-dash-stream-processor-assembly-1.0-SNAPSHOT.jar &
echo $! > work/spark.pid

