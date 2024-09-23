# MQTT
物联网1111
  
172.22.101.113


sudo docker run -d  --privileged=true \
--name kafka2 -p 9094:9092 \
-e KAFKA_BROKER_ID=2 \
-e KAFKA_ZOOKEEPER_CONNECT=172.22.101.113:2181 \
-e KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 \
-e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://172.22.101.113:9094 \
-e ALLOW_PLAINTEXT_LISTENER=yes \
bitnami/kafka:latest

docker run -d \
  --name kafka-ui \
  -p 8085:8080 \
  -e KAFKA_CLUSTERS_0_NAME=local \
  -e KAFKA_CLUSTERS_0_BOOTSTRAP_SERVERS=kafka0:9092,kafka1:9093,kafka2:9094 \
  -e SERVER_SERVLET_CONTEXT_PATH=/ \
  -e AUTH_TYPE=LOGIN_FORM \
  -e SPRING_SECURITY_USER_NAME=admin \
  -e SPRING_SECURITY_USER_PASSWORD=admin \
  -e JAVA_OPTS=-Dfile.encoding=UTF-8 \
  provectuslabs/kafka-ui:latest


  ##这里的NAme可以换为节点名称，比如192.168.2.205，区分节点
docker run --name=kafka-ui -d -e KAFKA_CLUSTERS_0_NAME=local-kafka -e KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS=172.22.101.113:9092 -p 8085:8080 provectuslabs/kafka-ui:latest
