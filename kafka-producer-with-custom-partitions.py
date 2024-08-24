from json import dumps
from time import sleep
from kafka import KafkaProducer

def custom_partitioner(key #here the key is byte  
                       , all_partitions
                       , available):
    print("The key is {}".format(key))

    print("The key is {}".format(all_partitions))
    print("after decoding of The key : {}".format(key.decode('UTF-8')))
    return int(key.decode('UTF-8'))%len(all_partitions)

topic_name = 'hello_world4'

producer = KafkaProducer(bootstrap_servers = ['localhost:9092'] , 
                         partitioner = custom_partitioner,
                        #value_serializer = lambda x : dumps(x).encode('utf-8')
                          )

sleep(4)
producer.send(topic_name , bytes(topic_name, 'utf-8') , #partition = 1 ,
               key = b'123') 
sleep(4)

producer.close()