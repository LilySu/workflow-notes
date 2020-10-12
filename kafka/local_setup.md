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

#### Configuration Advice

- It's better to have more, smaller clusters where possible, though there can be up to 200 or more nodes per cluster
- Set a 'quota' to define the amount of bandwidth to allocate to specific services instances or load-balanced groups.
- For global ordering rather just default key-based pair ordering, assign a topic to a single partition, even though throughput would be effected. Upon failure, messages are simply rerouted to a second service.
- Always have 3 replicas for each partition to eliminate data loss
- Also to eliminate data loss, set the producer to wait for replication to complete before proceeding even if this slows down compute time
- Kafka's load balancing involves balancing compute over parititons.
- Compaction of topics allows topics to be smaller, meaning easier to move from machine to machine. One can always save non-compacted topic as another topic and have a third that mix-matches.


