#!/usr/bin/env bash

if [ $# -ne 3 ]; then
  echo "usage: ./migrate_kafka_partitions.sh topic_name broker_id_list"
  exit 1
fi

topic_to_move=$1
new_brokers=$2

if [ -d "~/local/kafka" ]; then
  echo "make sure that kafka is in the path of ~/local/kafka"
  exit 2
fi

tmp_file=/tmp/${RANDOM}.txt
~/local/kafka/bin/kafka-list-topic.sh --zookeeper buffer.aqueducts.baidu.com --topic ${topic_to_move} >> ${tmp_file}

new_brokers_arry=(${new_brokers//,/ })

while read line; do
  partition_to_move_config=/tmp/${RANDOM}.json
  rm -f ${partition_to_move_config}

  partition=$(echo $line | awk '{print $4}')
  echo "migrating partition: $partition"

  leader=$(echo $line | awk '{print $6}')
  echo "leader: $leader"

  orig_replicas=$(echo $line | awk '{print $8}')
  echo "orig replicas: $orig_replicas"
  

  index=$(echo ${RANDOM} % ${#new_brokers_arry[@]} | bc)

  new_replicas=${leader},${new_brokers_arry[${index}]}
  echo "new replicas: $new_replicas"

  echo "{\"partitions\": [{\"topic\": \"${topic_to_move}\", \"partition\": ${partition}, \"replicas\": [${new_replicas}] }], \"version\":1}" >> ${partition_to_move_config}

  ~/local/kafka/bin/kafka-reassign-partitions.sh --zookeeper buffer.aqueducts.baidu.com --broker-list ${new_brokers} --manual-assignment-json-file ${partition_to_move_config} --execute 

  sleep 600s;
  echo "---------------------------------------------------------"
done < ${tmp_file}

rm -f ${tmp_file}

echo "done"
