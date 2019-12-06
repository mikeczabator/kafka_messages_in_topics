#!/bin/bash
printf "\n"
for TOPIC in $(./bin/kafka-topics.sh --list --zookeeper localhost:2181)
do
        ./bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list 127.0.0.1:9092 --topic $TOPIC --time -1 | while IFS=: read topic_name partition_id number; do echo "$number"; done | paste -sd+ - | bc | xargs printf "%s %'.f\n" "messages in $TOPIC :"
done
printf "\n"
