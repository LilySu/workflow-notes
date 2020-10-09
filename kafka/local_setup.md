#### Download Binary File From:
[http://kafka.apache.org/downloads](http://kafka.apache.org/downloads)

#### 7-Zip Extract into C:/

#### Route tmp/ to C:/
1.
- In config folder, open in Notepad file named`server`
- search for `log.dirs`
- replace `log.dirs=/temp/kafka-logs` with `log.dirs=c:/kafka/kafka-logs`
2.
- In config folder open file named `zookeeper.properties`
- replace `dataDir=/tmp/zookeeper-data` with `dataDir=c:/kafka/zookeeper-data`


#### Start Zookeeper instance, Bound to Port 2181
- In new cmd or powershell:
`.\bin\windows\zookeeper-server-start.bat .\config\zookeeper.properties`

#### Start Kafka Server
- In new cmd or powershell:
`.\bin\windows\kafka-server-start.bat .\config\server.properties`

#### Create a Topic
- In new cmd or powershell:
`.\bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic TestTopic`

#### Check For List of Topics
`.\bin\windows\kafka-topics.bat --list --zookeeper localhost:2181`

#### Produce: Insert Data to Topic
`.\bin\windows\kafka-console-producer.bat --broker-list localhost:9092 --topic TestTopic`
ie.
```
>this is my first message
>here is my second message
>final message
>Terminate batch job (Y/N)? Y
```

#### Consume: Subscribe and Read a Topic
`.\bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic TestTopic --from-beginning`

ie output.
```
this is my first message
here is my second message
final message
```

