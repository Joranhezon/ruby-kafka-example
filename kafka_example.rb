require 'ruby-kafka'

class KafkaExample
  def initialize(topic:, username:)
    @kafka = Kafka.new(['localhost:9092'], client_id: 'kafka-example')
    @topic = topic
    @username = username
  end

  def execute
    produce_messages
    consume_messages
  rescue Kafka::ConnectionError => error
    puts(error.message)
  end

  private

  def produce_messages
    # Instantiate a new producer
    producer = @kafka.producer

    # Add a message to this producer's buffer to specified topic
    message = "Oi, #{@username}. Espero que esteja gostando da Rubyconf. <3"
    producer.produce(message, topic: @topic)

    # Deliver messages to Kafka
    producer.deliver_messages
  end

  def consume_messages
    # Instantiate a new consumer
    consumer = @kafka.consumer(group_id: 'rubyconf-consumers')

    # Subscribe to a Kafka topic
    consumer.subscribe('test')

    # Print all messages that arrived at specified topic in a loop
    consumer.each_message do |message|
      puts("Topic #{message.topic} says: #{message.value}")
    end
  end
end

KafkaExample.new(topic: 'test', username: 'Marina').execute