#!/bin/bash

hadoop_docker_path=/mnt/data/liuzhipeng/hadoop_docker

# create master docker container
docker run \
    -itd \
    --name hadoop_master \
    -p 9870:9870 \
    -p 9000:9000 \
    --hostname master\
    -v $hadoop_docker_path/hadoop-3.1.0:/home/sparkl/hadoop \
    -v $hadoop_docker_path/start.sh:/home/sparkl/start.sh \
    -v $hadoop_docker_path/hadoop_data/master:/home/sparkl/hadoop_data/master \
    --ip 172.18.0.81 \
    --net hadoop_network \
    fly2wind2/hadoop_vm \
    sh -c '/home/sparkl/start.sh && /bin/bash' 


# create slave docker container

for slave_id in '1' '2' '3'
do

# create master docker container
docker run \
    -itd \
    --name hadoop_slave$slave_id \
    --hostname slave$slave_id\
    -v $hadoop_docker_path/hadoop-3.1.0:/home/sparkl/hadoop \
    -v $hadoop_docker_path/start.sh:/home/sparkl/start.sh \
    -v $hadoop_docker_path/hadoop_data/slave$slave_id:/home/sparkl/hadoop_data/slave\
    --ip 172.18.0.8$[$slave_id+1] \
    --net hadoop_network \
    fly2wind2/hadoop_vm \
    sh -c '/home/sparkl/start.sh && /bin/bash'

done

