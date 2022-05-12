from json import dumps
from kafka import KafkaProducer


def send_message(topic, message):
    producer = KafkaProducer(bootstrap_servers=['localhost:9092'], value_serializer=lambda x: dumps(x).encode('utf-8'))
    producer.send(topic, value=message)


