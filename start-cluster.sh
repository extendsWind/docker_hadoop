#!/bin/bash

# create master docker container
docker start hadoop_master

for slave_id in '1' '2' '3'
do
    docker start hadoop_slave$slave_id
done

