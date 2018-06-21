#!/bin/bash

# create master docker container
docker stop hadoop_master

for slave_id in '1' '2' '3'
do
    docker stop hadoop_slave$slave_id
done

