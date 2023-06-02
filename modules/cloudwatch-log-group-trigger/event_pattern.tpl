{
  "detail": {
    "eventName": ["CreateLogGroup"],
    "eventSource": ["logs.amazonaws.com"],
    %{~ if log_group_name_prefixes != null ~}
    "requestParameters": {
      "logGroupName": [
        %{~ for prefix in log_group_name_prefixes ~}
          {"prefix": "${prefix}"},
        %{~ endfor ~}
      ]
      }
    },
    %{~ endif ~}
  "detail-type": ["AWS API Call via CloudTrail"],
  "source": ["aws.logs"]
}
