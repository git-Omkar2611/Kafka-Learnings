import boto3.session

from kafka import KafkaConsumer
from kafka import TopicPartition, OffsetAndMetadata

import boto3
from aws_schema_registry import SchemaRegistryClient
from aws_schema_registry.adapter.kafka import KafkaDeserializer



session = boto3.Session(aws_access_key_id='' , aws_secret_access_key='' , region_name='ap-south-1')

glue_client = session.client('glue')

client = SchemaRegistryClient(  glue_client ,
    registry_name='my-registry'
)

deserializer = KafkaDeserializer(client)

consumer = KafkaConsumer(
                        'schema-registry-topic' , 
                        bootstrap_servers = ['127.0.0.1:64519'] ,
                          value_deserializer = deserializer ,
                            group_id = 'schema-registry-1' ,
                              auto_offset_reset = 'earliest' , 
                              enable_auto_commit = False )


for message in consumer :
    print(message)
    print("The value is : {}".format(message.value))
    print("The key is : {}".format(message.key))
    print("The topic is : {}".format(message.topic))
    print("The partition is : {}".format(message.partition))
    print("The offset is : {}".format(message.offset))
    print("The timestamp is : {}".format(message.timestamp))
    tp=TopicPartition(message.topic,message.partition)
    om = OffsetAndMetadata(message.offset+1, message.timestamp)
    consumer.commit({tp:om})
    print('*' * 100)
    consumer.close()

