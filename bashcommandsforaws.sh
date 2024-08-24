Launch one EC2 Instance & install kafka--
wget https://dlcdn.apache.org/kafka/3.8.0/kafka_2.12-3.8.0.tgz
tar -xvf kafka_2.12-3.8.0.tgz

To install Java --
-----------------------
java -version
##sudo yum install java-1.8.0-openjdk 
sudo yum install java-1.8.0-amazon-corretto.x86_64
java -version
cd kafka_2.12-3.8.0

Start Zoo-keeper:
-------------------------------
bin/zookeeper-server-start.sh config/zookeeper.properties


Start Kafka-server:
----------------------------------------
Duplicate the session & enter in a new console --
export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M" ##to limit kafka heap volume else it will throw error
cd kafka_2.12-3.8.0
bin/kafka-server-start.sh config/server.properties ##updated connectiontimneoutforzookeeper to 60000

It is pointing to private server , change server.properties so that it can run in public IP 

To do this , you can follow any of the 2 approaches shared belwo --
1)Do a vi config/server.properties in insert mode -- change ADVERTISED_LISTENERS to public ip of the EC2 instance
2)You can modify the file using Winscp also


Create the topic:
-----------------------------
Duplicate the session & enter in a new console --
cd kafka_2.12-3.8.0
bin/kafka-topics.sh --create --topic demo_testing2 --bootstrap-server 13.232.173.26:9092 --replication-factor 1 --partitions 1

Start Producer:
--------------------------
bin/kafka-console-producer.sh --topic demo_testing2 --bootstrap-server {13.232.173.26:9092} 

Start Consumer:
-------------------------
Duplicate the session & enter in a new console --
cd kafka_2.12-3.8.0
bin/kafka-console-consumer.sh --topic demo_testing2 --bootstrap-server {13.232.173.26:9092}

