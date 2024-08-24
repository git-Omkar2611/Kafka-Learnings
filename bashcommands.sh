D:/kafka_2.12-3.8.0/bin/windows/zookeeper-server-start.bat D:/kafka_2.12-3.8.0/config/zookeeper.properties

D:/kafka_2.12-3.8.0/bin/windows/kafka-server-start.bat D:/kafka_2.12-3.8.0/config/server.properties

D:/kafka_2.12-3.8.0/bin/windows/kafka-topics.bat --create --topic demo_testing1 --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1

D:/kafka_2.12-3.8.0/bin/windows/kafka-console-producer.bat --topic demo_testing1 --bootstrap-server localhost:9092
##parsekey
D:/kafka_2.12-3.8.0/bin/windows/kafka-console-producer.bat --bootstrap-server localhost:9092 --property "parse.key=true" --property "key.separator=:" --topic demo_testing1

D:/kafka_2.12-3.8.0/bin/windows/kafka-console-consumer.bat --topic hello_world1 --bootstrap-server localhost:9092

D:/kafka_2.12-3.8.0/bin/windows/kafka-console-consumer.bat --topic hello_world1 --from-beginning --bootstrap-server localhost:9092

Reading message from specific partition:
---------------------------------------------------------------------

D:/kafka_2.12-3.8.0/bin/windows/kafka-console-consumer.bat --topic demo_testing --from-beginning --bootstrap-server localhost:9092 --partition 2

Reading message from specific offset inside a specific partition:
---------------------------------------------------------------------------------------------------------------

D:/kafka_2.12-3.8.0/bin/windows/kafka-console-consumer.bat --topic demo_testing  --bootstrap-server localhost:9092 --partition 2 --offset 1


Reading message from specific offset :
-------------------------------------------------------------------------

D:/kafka_2.12-3.8.0/bin/windows/kafka-console-consumer.bat --topic demo_testing  --bootstrap-server localhost:9092  --offset 0

--consumer-group partition

D:/kafka_2.12-3.8.0/bin/windows/kafka-console-consumer.bat --topic hello_world2 --from-beginning --bootstrap-server localhost:9092 --group my-first-consumer-group

D:/kafka_2.12-3.8.0/bin/windows/kafka-consumer-groups.bat --bootstrap-server localhost:9092 --describe --group omkar-group


Inspecting the .index file:
D:/kafka_2.12-3.8.0/bin/windows/kafka-run-class.bat  kafka.tools.DumpLogSegments --files D:/kafka_logs/server_logs/hello_world4-0/00000000000000000000.index --deep-iteration --print-data-log




D:/kafka_2.12-3.8.0/bin/windows/schema-registry-start.bat D:/kafka_2.12-3.8.0/config/schema-registry.properties