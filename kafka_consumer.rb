require 'ruby-kafka'

class KafkaConsumer
  def initialize(topic:)
    @kafka = Kafka.new(['localhost:9092'], client_id: 'kafka-example')
    @topic = topic
  end

  def execute
    # Instantiate a new consumer
    consumer = @kafka.consumer(group_id: 'rubyconf-consumers')

    # Subscribe to a Kafka topic
    consumer.subscribe(@topic)

    # Print all messages that arrived at specified topic in a loop
    consumer.each_message do |message|
      puts("Topic #{message.topic} says: #{message.value}")
    end
  rescue Kafka::ConnectionError => error
    puts(error.message)
  end
end

KafkaConsumer.new(topic: 'test').execute