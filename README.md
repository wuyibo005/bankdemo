# bankdemo
bankdemo
微服务环境下，分布式事务dome
使用dockerfile 实现多个images 的构建
用Jenkins实现docker 构建images，构建命令如下：
#设置宿主机的docker远程访问地址
export DOCKER_HOST=tcp://192.168.20.174:2375
docker login --username=100007533986 --password=bobo1015 ccr.ccs.tencentyun.com

docker build -t ccr.ccs.tencentyun.com/moto/eurekaservice:${BUILD_NUMBER} --target eurekaservice .

#docker -H $DOCKER_HOST build -t  ccr.ccs.tencentyun.com/moto/eurekaservice:${BUILD_NUMBER} .
docker -H $DOCKER_HOST push ccr.ccs.tencentyun.com/moto/eurekaservice:${BUILD_NUMBER}
#docker -H $DOCKER_HOST rmi -f ccr.ccs.tencentyun.com/moto/eurekaservice:${BUILD_NUMBER}

docker -H $DOCKER_HOST build -t  ccr.ccs.tencentyun.com/moto/tx-manager:${BUILD_NUMBER} --target tx-manager .
docker -H $DOCKER_HOST push ccr.ccs.tencentyun.com/moto/tx-manager:${BUILD_NUMBER}


docker -H $DOCKER_HOST build -t  ccr.ccs.tencentyun.com/moto/bank-a:${BUILD_NUMBER} --target bank-a .
docker -H $DOCKER_HOST push ccr.ccs.tencentyun.com/moto/bank-a:${BUILD_NUMBER}

docker -H $DOCKER_HOST build -t  ccr.ccs.tencentyun.com/moto/bank-b:${BUILD_NUMBER} --target bank-b .
docker -H $DOCKER_HOST push ccr.ccs.tencentyun.com/moto/bank-b:${BUILD_NUMBER}
因为我用的是docker部署是Jenkins，于是使用的是远程docker实现build功能