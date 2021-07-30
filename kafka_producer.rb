require 'ruby-kafka'

class KafkaProducer
  def initialize(topic:, username:)
    @kafka = Kafka.new(['localhost:9092'], client_id: 'kafka-example')
    @topic = topic
    @username = username
  end

  def execute
    # Instantiate a new producer
    producer = @kafka.producer

    # Add a message to this producer's buffer to specified topic
    message = "Oi, #{@username}. Espero que esteja gostando da Rubyconf. <3"
    producer.produce(message, topic: @topic)

    # Deliver messages to Kafka
    producer.deliver_messages
  rescue Kafka::ConnectionError => error
    puts(error.message)
  end
end

KafkaProducer.new(topic: 'test', username: 'Marina').execute