
# 使用Docker搭建4节点的HDFS集群的脚本

## Docker Images

构建了两个镜像，下面使用hadoop_vm，已上传docker hub上的fly2wind2/hadoop_vm。(偷懒没写dockerfile，镜像比较大）

hadoop3 基于manjaor，包含sshd（需要启动）、oracle-jdk8和基本的工具、Hadoop 3.1.0

hadoop_vm 在hadoop3镜像的基础上删除了Hadoop 3.1.0 （准备使用挂载目录放入）

## 使用当前镜像的需要的启动操作

镜像启动时的：

- Hadoop相关文件挂载
- 各个节点上的数据目录挂载
- start.sh 作为启动脚本

start.sh 作为启动脚本进行下面两项操作：

- 启动ssh进程
- /etc/hosts 添加所有节点

新建docker子网 ` docker network create --subnet=172.18.0.0/16 hadoop_network`

## 几个脚本

create-cluster.sh 创建集群 
start-hdfs.sh docker容器中启动hdfs
stop-hdfs.sh docker容器中停止hdfs
stop-cluster.sh 停止运行的docker容器

