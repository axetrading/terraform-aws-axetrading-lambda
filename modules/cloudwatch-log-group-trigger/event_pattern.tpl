{
  "detail-type": ["AWS API Call via CloudTrail"],
  "source": ["aws.logs"],
  "detail": {
    %{~ if log_group_name_prefixes != null ~}
    "requestParameters": 
    ${jsonencode({
      "logGroupName": [for prefix in log_group_name_prefixes : {"prefix": "${prefix}"}]
    })},
    %{~ endif ~}
    "eventName": ["CreateLogGroup"],
    "eventSource": ["logs.amazonaws.com"]
    }
}