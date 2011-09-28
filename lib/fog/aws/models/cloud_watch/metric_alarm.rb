require 'fog/core/model'

module Fog
  module AWS
    class CloudWatch

      class MetricAlarm < Fog::Model
        attribute :actions_enabled, :aliases => 'ActionsEnabled'
        attribute :alarm_actions, :aliases => 'AlarmActions'
        attribute :arn, :aliases => 'AlarmArn'        
        attribute :configuration_updated_timestamp, :aliases => 'AlarmConfigurationUpdatedTimestamp'
        attribute :comparison_operator, :aliases => 'ComparisonOperator'
        attribute :description, :aliases => 'AlarmDescription'
        attribute :dimensions, :aliases => 'Dimensions'
        attribute :evaluation_periods, :aliases => 'EvaluationPeriods', 
        attribute :insufficient_data_actions, :aliases => 'InsufficientDataActions', 
        attribute :metric_name, :aliases => 'MetricName'
        attribute :name, :aliases => 'AlarmName'
        attribute :namespace, :aliases => 'Namespace'
        attribute :ok_actions, :aliases => 'OKActions'
        attribute :period, :aliases => 'Period'
        attribute :state_reason, :aliases => 'StateReason'
        attribute :state_reason_data, :aliases => 'StateReasonData'        
        attribute :state_value, :aliases => 'StateValue'
        attribute :statistic, :aliases => 'Statistic'
        attribute :threshold, :aliases => 'Threshold'
        attribute :unit, :aliases => 'Unit'
        attribute :state_updated_timestamp, :aliases => 'StateUpdatedTimestamp'
      end
    end
  end
end