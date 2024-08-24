from json import dumps
from time import sleep
from kafka import KafkaProducer

topic_name = 'hello_world3'
producer = KafkaProducer(bootstrap_servers = ['localhost:9092'] , 
                         key_serializer = str.encode,
                        value_serializer = lambda x : dumps(x).encode('utf-8')
                          )

 
data2 = {'number' : 2} 
data3 = {'number' : 3} 
data4 = {'number' : 4} 
data5 = {'number' : 5} 
data6 = {'number' : 6} 

producer.send(topic_name , value=data1 , #partition = 1 ,
               key = 'foo') 
sleep(5)
producer.send(topic_name , value=data2 , #partition = 1, 
              key = 'foo') 
sleep(5)
# producer.send(topic_name , value=data3 , partition = 1, key = b'foo') 
# sleep(5)
# producer.send(topic_name , value=data4 , partition = 2 , key = b'foo')
# sleep(5)
# producer.send(topic_name , value=data5 , partition = 2, key = b'foo') 
# sleep(5)
# producer.send(topic_name , value=data6 , partition = 2, key = b'foo') 
# sleep(5)
# producer.send(topic_name , value=data6 , partition = 0, key = b'foo') 
producer.close()