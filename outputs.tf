output "kinesis_firehose_delivery_streams_id" {
  description = "Map of id values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kinesis_firehose_delivery_streams_arn" {
  description = "Map of arn values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "kinesis_firehose_delivery_streams_destination" {
  description = "Map of destination values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.destination if v.destination != null && length(v.destination) > 0 }
}
output "kinesis_firehose_delivery_streams_destination_id" {
  description = "Map of destination_id values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.destination_id if v.destination_id != null && length(v.destination_id) > 0 }
}
output "kinesis_firehose_delivery_streams_elasticsearch_configuration" {
  description = "Map of elasticsearch_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.elasticsearch_configuration) if v.elasticsearch_configuration != null && length(v.elasticsearch_configuration) > 0 }
}
output "kinesis_firehose_delivery_streams_extended_s3_configuration" {
  description = "Map of extended_s3_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.extended_s3_configuration) if v.extended_s3_configuration != null && length(v.extended_s3_configuration) > 0 }
}
output "kinesis_firehose_delivery_streams_http_endpoint_configuration" {
  description = "Map of http_endpoint_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.http_endpoint_configuration) if v.http_endpoint_configuration != null && length(v.http_endpoint_configuration) > 0 }
  sensitive   = true
}
output "kinesis_firehose_delivery_streams_iceberg_configuration" {
  description = "Map of iceberg_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.iceberg_configuration) if v.iceberg_configuration != null && length(v.iceberg_configuration) > 0 }
}
output "kinesis_firehose_delivery_streams_kinesis_source_configuration" {
  description = "Map of kinesis_source_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.kinesis_source_configuration) if v.kinesis_source_configuration != null && length(v.kinesis_source_configuration) > 0 }
}
output "kinesis_firehose_delivery_streams_msk_source_configuration" {
  description = "Map of msk_source_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.msk_source_configuration) if v.msk_source_configuration != null && length(v.msk_source_configuration) > 0 }
}
output "kinesis_firehose_delivery_streams_name" {
  description = "Map of name values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.name if v.name != null && length(v.name) > 0 }
}
output "kinesis_firehose_delivery_streams_opensearch_configuration" {
  description = "Map of opensearch_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.opensearch_configuration) if v.opensearch_configuration != null && length(v.opensearch_configuration) > 0 }
}
output "kinesis_firehose_delivery_streams_opensearchserverless_configuration" {
  description = "Map of opensearchserverless_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.opensearchserverless_configuration) if v.opensearchserverless_configuration != null && length(v.opensearchserverless_configuration) > 0 }
}
output "kinesis_firehose_delivery_streams_redshift_configuration" {
  description = "Map of redshift_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.redshift_configuration) if v.redshift_configuration != null && length(v.redshift_configuration) > 0 }
  sensitive   = true
}
output "kinesis_firehose_delivery_streams_region" {
  description = "Map of region values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.region if v.region != null && length(v.region) > 0 }
}
output "kinesis_firehose_delivery_streams_server_side_encryption" {
  description = "Map of server_side_encryption values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.server_side_encryption) if v.server_side_encryption != null && length(v.server_side_encryption) > 0 }
}
output "kinesis_firehose_delivery_streams_snowflake_configuration" {
  description = "Map of snowflake_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.snowflake_configuration) if v.snowflake_configuration != null && length(v.snowflake_configuration) > 0 }
  sensitive   = true
}
output "kinesis_firehose_delivery_streams_splunk_configuration" {
  description = "Map of splunk_configuration values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => one(v.splunk_configuration) if v.splunk_configuration != null && length(v.splunk_configuration) > 0 }
}
output "kinesis_firehose_delivery_streams_tags" {
  description = "Map of tags values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "kinesis_firehose_delivery_streams_tags_all" {
  description = "Map of tags_all values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "kinesis_firehose_delivery_streams_version_id" {
  description = "Map of version_id values across all kinesis_firehose_delivery_streams, keyed the same as var.kinesis_firehose_delivery_streams"
  value       = { for k, v in aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams : k => v.version_id if v.version_id != null && length(v.version_id) > 0 }
}

