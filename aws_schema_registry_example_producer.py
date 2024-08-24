import boto3
from time import sleep
from json import dumps

from kafka import KafkaProducer

from aws_schema_registry import DataAndSchema  , SchemaRegistryClient
from aws_schema_registry.avro import AvroSchema
from aws_schema_registry.adapter.kafka import KafkaSerializer

session = boto3.Session(aws_access_key_id='' , aws_secret_access_key='' , region_name='ap-south-1')

glue_client = session.client('glue')

client = SchemaRegistryClient(  glue_client ,
    registry_name='my-registry'
)

serializer = KafkaSerializer(client)

producer = KafkaProducer( 
    bootstrap_servers = ['127.0.0.1:64519'] , value_serializer = serializer
)

with open(r'D://kafka_2.12-3.8.0//Kafka_Implementation//schema_registry.avsc' ,'r') as schema_file :
    schema = AvroSchema(schema_file.read())


data = {
    'name': 'Omkar Patil',
    'Age': 123
}


record_metadata = producer.send('schema-registry-topic' , value = (data,schema)).get(timeout = 10)
print(record_metadata.topic)
print(record_metadata.partition)
print(record_metadata.offset)






