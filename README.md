# Kafka Ruby Script Example

This is a simple Kafka example using ruby and the gem ```ruby-kafka```, used in a presentation made at [RubyConf Brasil 2021](https://online.rubyconf.com.br/). It gets an username as argument and use Kafka to publish it to a topic, then consume the message and print it on the terminal. The purpose of this code and presentation is to introduce newcomers to Kafka and how to use it with Ruby.

## Getting Started
1. Make sure that you have Ruby installed. If you don't,check [this guide](https://www.ruby-lang.org/ptdocumentation/installation/) on how to install it.

2. Make sure that you have Kafka installed. If you don't,check [this guide](https://kafka.apache.org/quickstart) onhow to install it.

3. Install ```ruby-rafka```. You can do that by running thefollowing command:
 ```gem install ruby-kafka```

4. Run zookeeper server. To do that, go to the directorythat you installed kafka and run the following command:
 ```bin/zookeeper-server-start.sh config/zookeeperproperties```
5. Run Kafka server, To do that, go to the directory thatyou installed kafka and run the following command:
```bin/kafka-server-start.sh config/server.properties```

6. Create a Kafka topic. In this example, we are using atopic called ```test```, but you can use whatever name youlike, just remember to edit the code with the name youchoose. To create a topic, run the following command withboth Kafka and Zookeeper servers running:
```bin/kafka-topics.sh --create --topic test--bootstrap-server localhost:9092```

7. Run the consumer code in a terminal using the following command:
```ruby kafka_consumer.rb```

8. Run the producer code in a different terminal using the following command:
```ruby kafka_producer.rb```

Now watch as the message your producer sent is printed by our consumer in it's terminal!

**Obs: The code will be running on a loop, waiting for new messages to consume. If you want to stop it, simply use ```Ctrl+C```**

## Bonus
Now that you ran the code and is looking at the loop waiting for new messages to consume, you may be wondering how to produce messages outside our example. To do that, you can run the Producer console on your terminal, and any message you send there will be consumed by our code. To do that, run the following command on your Kafka directory:

```bin/kafka-console-producer.sh --topic test --bootstrap-server localhost:9092```

And there you go! Now that this console is open, just type any message that you would like and watch it being consumed in real time. If you also want to open the Consumer Console and see the difference between our code and the pure consumer side, run the following command:

```bin/kafka-console-consumer.sh --topic test --from-beginning --bootstrap-server localhost:9092```

## References

This was the main material used to make this presentation and code:

- [Kafka: The definitive guide book](https://www.confluent.io/resources/kafka-the-definitive-guide/?utm_medium=sem&utm_source=google&utm_campaign=ch.sem_br.nonbrand_tp.prs_tgt.content-search_mt.xct_rgn.latam_lng.eng_dv.all_con.ktdg&utm_term=kafka%20definitive%20guide&creative=&device=c&placement=&gclid=Cj0KCQjwl_SHBhCQARIsAFIFRVWLP16QPFKQTFgW3pXi7jLKhloLVLI0ddKH7LQy0D6Dge108m712twaAvGBEALw_wcB)
- [Ruby Kafka Gem](https://github.com/zendesk/ruby-kafka)