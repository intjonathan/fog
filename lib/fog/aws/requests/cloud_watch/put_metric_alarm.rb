module Fog
  module AWS
    class CloudWatch
      class Real

        require 'fog/aws/parsers/cloud_watch/put_metric_alarm'

        # Creates or updates an alarm and associates it with the specified Amazon CloudWatch metric.
        #
        # ==== Options
        # * AlarmActions<~Array>: The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each element is the string ARN of the  SNS topic or Autoscaling policy to publish to.
        # * ActionsEnabled<~Boolean>: Whether any actions should be executed during alarm state changes.
        # * AlarmDescription<~String>: The description for the alarm.
        # * AlarmName<~String>: A name for the alarm.
        # * ComparisonOperaton<~String>: The arithmetic operation to use when comparing the specified Statistic and Threshold, Statistic first.
        # * Dimensions<~Array>: a list of dimensions to filter against,
        #     Name : The name of the dimension
        #     Value : The value to filter against        
        # * MetricName<~String>: The name of the associated metric.
        # * Namespace<~String>: The namespace of the associated metric.
        # * OKActions<~Array>: The list of actions to execute when this alarm transitions into an OK state from any other state. Specified similarly to AlarmActions.
        # * Period<~Integer>: The period in seconds over which the specified statistic is applied.
        # * Statistic<~String>: The statistic to apply to the associated metric.
        # * Threshold<~Double>: The value against which the specified statistic is compared.
        # * Unit<~String>: The unit for the alarm's associated metric.
        # ==== Returns
        # * response<~Excon::Response>:
        #
        # ==== See Also
        # http://docs.amazonwebservices.com/AmazonCloudWatch/latest/APIReference/index.html?API_PutMetricAlarm.html
        #
        def put_metric_alarm(options={})
          if alarm_actions = options.delete('AlarmActions')
            options.merge!(AWS.indexed_param('AlarmActions.member.%d.Name', alarm_actions))
          end
          
          if ok_actions = options.delete('OKActions')
            options.merge!(AWS.indexed_param('OKActions.member.%d.Name', ok_actions))
          end
          
          if dimensions = options.delete('Dimensions')
            options.merge!(AWS.indexed_param('Dimensions.member.%d.Name', dimensions.collect {|dimension| dimension['Name']}))
            options.merge!(AWS.indexed_param('Dimensions.member.%d.Value', dimensions.collect {|dimension| dimension['Value']}))
          end

          request({
              'Action'    => 'PutMetricAlarm',
              :parser     => Fog::Parsers::AWS::CloudWatch::PutMetricAlarm.new
            }.merge(options))
        end

      end
    end
  end
end
