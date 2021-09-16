# frozen_string_literal: true

require 'aws_backend'

class AWSMQBroker < AwsResourceBase
  name 'aws_mq_broker'
  desc 'Describes a Amazon MQ broker.'

  example "
    describe aws_mq_broker(broker_id: 'test1') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    opts = { broker_id: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: [:broker_id])

    raise ArgumentError, "#{@__resource_name__}: broker_id must be provided" unless opts[:broker_id] && !opts[:broker_id].empty?
    @display_name = opts[:broker_id]
    resp = @aws.batch_client.describe_job_definitions({ broker_id: opts[:broker_id] })
    @brokers = resp.to_h
    create_resource_methods(@brokers)
  end

  def id
    return nil unless exists?
    @brokers[:broker_id]
  end

  def exists?
    !@brokers.nil? && !@brokers.empty?
  end

  def to_s
    "Broker Name: #{@display_name}"
  end
end
