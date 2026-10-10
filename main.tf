resource "aws_kinesis_firehose_delivery_stream" "kinesis_firehose_delivery_streams" {
  for_each = var.kinesis_firehose_delivery_streams

  destination    = each.value.destination
  name           = each.value.name
  arn            = each.value.arn
  destination_id = each.value.destination_id
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all
  version_id     = each.value.version_id

  dynamic "elasticsearch_configuration" {
    for_each = each.value.elasticsearch_configuration != null ? [each.value.elasticsearch_configuration] : []
    content {
      buffering_interval = elasticsearch_configuration.value.buffering_interval
      buffering_size     = elasticsearch_configuration.value.buffering_size
      dynamic "cloudwatch_logging_options" {
        for_each = elasticsearch_configuration.value.cloudwatch_logging_options != null ? [elasticsearch_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      cluster_endpoint      = elasticsearch_configuration.value.cluster_endpoint
      domain_arn            = elasticsearch_configuration.value.domain_arn
      index_name            = elasticsearch_configuration.value.index_name
      index_rotation_period = elasticsearch_configuration.value.index_rotation_period
      dynamic "processing_configuration" {
        for_each = elasticsearch_configuration.value.processing_configuration != null ? [elasticsearch_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      retry_duration = elasticsearch_configuration.value.retry_duration
      role_arn       = elasticsearch_configuration.value.role_arn
      s3_backup_mode = elasticsearch_configuration.value.s3_backup_mode
      s3_configuration {
        bucket_arn         = elasticsearch_configuration.value.s3_configuration.bucket_arn
        buffering_interval = elasticsearch_configuration.value.s3_configuration.buffering_interval
        buffering_size     = elasticsearch_configuration.value.s3_configuration.buffering_size
        dynamic "cloudwatch_logging_options" {
          for_each = elasticsearch_configuration.value.s3_configuration.cloudwatch_logging_options != null ? [elasticsearch_configuration.value.s3_configuration.cloudwatch_logging_options] : []
          content {
            enabled         = cloudwatch_logging_options.value.enabled
            log_group_name  = cloudwatch_logging_options.value.log_group_name
            log_stream_name = cloudwatch_logging_options.value.log_stream_name
          }
        }
        compression_format  = elasticsearch_configuration.value.s3_configuration.compression_format
        error_output_prefix = elasticsearch_configuration.value.s3_configuration.error_output_prefix
        kms_key_arn         = elasticsearch_configuration.value.s3_configuration.kms_key_arn
        prefix              = elasticsearch_configuration.value.s3_configuration.prefix
        role_arn            = elasticsearch_configuration.value.s3_configuration.role_arn
      }
      type_name = elasticsearch_configuration.value.type_name
      dynamic "vpc_config" {
        for_each = elasticsearch_configuration.value.vpc_config != null ? [elasticsearch_configuration.value.vpc_config] : []
        content {
          role_arn           = vpc_config.value.role_arn
          security_group_ids = vpc_config.value.security_group_ids
          subnet_ids         = vpc_config.value.subnet_ids
        }
      }
    }
  }

  dynamic "extended_s3_configuration" {
    for_each = each.value.extended_s3_configuration != null ? [each.value.extended_s3_configuration] : []
    content {
      bucket_arn         = extended_s3_configuration.value.bucket_arn
      buffering_interval = extended_s3_configuration.value.buffering_interval
      buffering_size     = extended_s3_configuration.value.buffering_size
      dynamic "cloudwatch_logging_options" {
        for_each = extended_s3_configuration.value.cloudwatch_logging_options != null ? [extended_s3_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      compression_format = extended_s3_configuration.value.compression_format
      custom_time_zone   = extended_s3_configuration.value.custom_time_zone
      dynamic "data_format_conversion_configuration" {
        for_each = extended_s3_configuration.value.data_format_conversion_configuration != null ? [extended_s3_configuration.value.data_format_conversion_configuration] : []
        content {
          enabled = data_format_conversion_configuration.value.enabled
          input_format_configuration {
            deserializer {
              dynamic "hive_json_ser_de" {
                for_each = data_format_conversion_configuration.value.input_format_configuration.deserializer.hive_json_ser_de != null ? [data_format_conversion_configuration.value.input_format_configuration.deserializer.hive_json_ser_de] : []
                content {
                  timestamp_formats = hive_json_ser_de.value.timestamp_formats
                }
              }
              dynamic "open_x_json_ser_de" {
                for_each = data_format_conversion_configuration.value.input_format_configuration.deserializer.open_x_json_ser_de != null ? [data_format_conversion_configuration.value.input_format_configuration.deserializer.open_x_json_ser_de] : []
                content {
                  case_insensitive                         = open_x_json_ser_de.value.case_insensitive
                  column_to_json_key_mappings              = open_x_json_ser_de.value.column_to_json_key_mappings
                  convert_dots_in_json_keys_to_underscores = open_x_json_ser_de.value.convert_dots_in_json_keys_to_underscores
                }
              }
            }
          }
          output_format_configuration {
            serializer {
              dynamic "orc_ser_de" {
                for_each = data_format_conversion_configuration.value.output_format_configuration.serializer.orc_ser_de != null ? [data_format_conversion_configuration.value.output_format_configuration.serializer.orc_ser_de] : []
                content {
                  block_size_bytes                        = orc_ser_de.value.block_size_bytes
                  bloom_filter_columns                    = orc_ser_de.value.bloom_filter_columns
                  bloom_filter_false_positive_probability = orc_ser_de.value.bloom_filter_false_positive_probability
                  compression                             = orc_ser_de.value.compression
                  dictionary_key_threshold                = orc_ser_de.value.dictionary_key_threshold
                  enable_padding                          = orc_ser_de.value.enable_padding
                  format_version                          = orc_ser_de.value.format_version
                  padding_tolerance                       = orc_ser_de.value.padding_tolerance
                  row_index_stride                        = orc_ser_de.value.row_index_stride
                  stripe_size_bytes                       = orc_ser_de.value.stripe_size_bytes
                }
              }
              dynamic "parquet_ser_de" {
                for_each = data_format_conversion_configuration.value.output_format_configuration.serializer.parquet_ser_de != null ? [data_format_conversion_configuration.value.output_format_configuration.serializer.parquet_ser_de] : []
                content {
                  block_size_bytes              = parquet_ser_de.value.block_size_bytes
                  compression                   = parquet_ser_de.value.compression
                  enable_dictionary_compression = parquet_ser_de.value.enable_dictionary_compression
                  max_padding_bytes             = parquet_ser_de.value.max_padding_bytes
                  page_size_bytes               = parquet_ser_de.value.page_size_bytes
                  writer_version                = parquet_ser_de.value.writer_version
                }
              }
            }
          }
          schema_configuration {
            catalog_id    = data_format_conversion_configuration.value.schema_configuration.catalog_id
            database_name = data_format_conversion_configuration.value.schema_configuration.database_name
            region        = data_format_conversion_configuration.value.schema_configuration.region
            role_arn      = data_format_conversion_configuration.value.schema_configuration.role_arn
            table_name    = data_format_conversion_configuration.value.schema_configuration.table_name
            version_id    = data_format_conversion_configuration.value.schema_configuration.version_id
          }
        }
      }
      dynamic "dynamic_partitioning_configuration" {
        for_each = extended_s3_configuration.value.dynamic_partitioning_configuration != null ? [extended_s3_configuration.value.dynamic_partitioning_configuration] : []
        content {
          enabled        = dynamic_partitioning_configuration.value.enabled
          retry_duration = dynamic_partitioning_configuration.value.retry_duration
        }
      }
      error_output_prefix = extended_s3_configuration.value.error_output_prefix
      file_extension      = extended_s3_configuration.value.file_extension
      kms_key_arn         = extended_s3_configuration.value.kms_key_arn
      prefix              = extended_s3_configuration.value.prefix
      dynamic "processing_configuration" {
        for_each = extended_s3_configuration.value.processing_configuration != null ? [extended_s3_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      role_arn = extended_s3_configuration.value.role_arn
      dynamic "s3_backup_configuration" {
        for_each = extended_s3_configuration.value.s3_backup_configuration != null ? [extended_s3_configuration.value.s3_backup_configuration] : []
        content {
          bucket_arn         = s3_backup_configuration.value.bucket_arn
          buffering_interval = s3_backup_configuration.value.buffering_interval
          buffering_size     = s3_backup_configuration.value.buffering_size
          dynamic "cloudwatch_logging_options" {
            for_each = s3_backup_configuration.value.cloudwatch_logging_options != null ? [s3_backup_configuration.value.cloudwatch_logging_options] : []
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }
          compression_format  = s3_backup_configuration.value.compression_format
          error_output_prefix = s3_backup_configuration.value.error_output_prefix
          kms_key_arn         = s3_backup_configuration.value.kms_key_arn
          prefix              = s3_backup_configuration.value.prefix
          role_arn            = s3_backup_configuration.value.role_arn
        }
      }
      s3_backup_mode = extended_s3_configuration.value.s3_backup_mode
    }
  }

  dynamic "http_endpoint_configuration" {
    for_each = each.value.http_endpoint_configuration != null ? [each.value.http_endpoint_configuration] : []
    content {
      access_key         = http_endpoint_configuration.value.access_key
      buffering_interval = http_endpoint_configuration.value.buffering_interval
      buffering_size     = http_endpoint_configuration.value.buffering_size
      dynamic "cloudwatch_logging_options" {
        for_each = http_endpoint_configuration.value.cloudwatch_logging_options != null ? [http_endpoint_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      name = http_endpoint_configuration.value.name
      dynamic "processing_configuration" {
        for_each = http_endpoint_configuration.value.processing_configuration != null ? [http_endpoint_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      dynamic "request_configuration" {
        for_each = http_endpoint_configuration.value.request_configuration != null ? [http_endpoint_configuration.value.request_configuration] : []
        content {
          dynamic "common_attributes" {
            for_each = request_configuration.value.common_attributes != null ? request_configuration.value.common_attributes : []
            content {
              name  = common_attributes.value.name
              value = common_attributes.value.value
            }
          }
          content_encoding = request_configuration.value.content_encoding
        }
      }
      retry_duration = http_endpoint_configuration.value.retry_duration
      role_arn       = http_endpoint_configuration.value.role_arn
      s3_backup_mode = http_endpoint_configuration.value.s3_backup_mode
      s3_configuration {
        bucket_arn         = http_endpoint_configuration.value.s3_configuration.bucket_arn
        buffering_interval = http_endpoint_configuration.value.s3_configuration.buffering_interval
        buffering_size     = http_endpoint_configuration.value.s3_configuration.buffering_size
        dynamic "cloudwatch_logging_options" {
          for_each = http_endpoint_configuration.value.s3_configuration.cloudwatch_logging_options != null ? [http_endpoint_configuration.value.s3_configuration.cloudwatch_logging_options] : []
          content {
            enabled         = cloudwatch_logging_options.value.enabled
            log_group_name  = cloudwatch_logging_options.value.log_group_name
            log_stream_name = cloudwatch_logging_options.value.log_stream_name
          }
        }
        compression_format  = http_endpoint_configuration.value.s3_configuration.compression_format
        error_output_prefix = http_endpoint_configuration.value.s3_configuration.error_output_prefix
        kms_key_arn         = http_endpoint_configuration.value.s3_configuration.kms_key_arn
        prefix              = http_endpoint_configuration.value.s3_configuration.prefix
        role_arn            = http_endpoint_configuration.value.s3_configuration.role_arn
      }
      dynamic "secrets_manager_configuration" {
        for_each = http_endpoint_configuration.value.secrets_manager_configuration != null ? [http_endpoint_configuration.value.secrets_manager_configuration] : []
        content {
          enabled    = secrets_manager_configuration.value.enabled
          role_arn   = secrets_manager_configuration.value.role_arn
          secret_arn = secrets_manager_configuration.value.secret_arn
        }
      }
      url = http_endpoint_configuration.value.url
    }
  }

  dynamic "iceberg_configuration" {
    for_each = each.value.iceberg_configuration != null ? [each.value.iceberg_configuration] : []
    content {
      append_only        = iceberg_configuration.value.append_only
      buffering_interval = iceberg_configuration.value.buffering_interval
      buffering_size     = iceberg_configuration.value.buffering_size
      catalog_arn        = iceberg_configuration.value.catalog_arn
      dynamic "cloudwatch_logging_options" {
        for_each = iceberg_configuration.value.cloudwatch_logging_options != null ? [iceberg_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      dynamic "destination_table_configuration" {
        for_each = iceberg_configuration.value.destination_table_configuration != null ? iceberg_configuration.value.destination_table_configuration : []
        content {
          database_name          = destination_table_configuration.value.database_name
          s3_error_output_prefix = destination_table_configuration.value.s3_error_output_prefix
          table_name             = destination_table_configuration.value.table_name
          unique_keys            = destination_table_configuration.value.unique_keys
        }
      }
      dynamic "processing_configuration" {
        for_each = iceberg_configuration.value.processing_configuration != null ? [iceberg_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      retry_duration = iceberg_configuration.value.retry_duration
      role_arn       = iceberg_configuration.value.role_arn
      s3_backup_mode = iceberg_configuration.value.s3_backup_mode
      s3_configuration {
        bucket_arn         = iceberg_configuration.value.s3_configuration.bucket_arn
        buffering_interval = iceberg_configuration.value.s3_configuration.buffering_interval
        buffering_size     = iceberg_configuration.value.s3_configuration.buffering_size
        dynamic "cloudwatch_logging_options" {
          for_each = iceberg_configuration.value.s3_configuration.cloudwatch_logging_options != null ? [iceberg_configuration.value.s3_configuration.cloudwatch_logging_options] : []
          content {
            enabled         = cloudwatch_logging_options.value.enabled
            log_group_name  = cloudwatch_logging_options.value.log_group_name
            log_stream_name = cloudwatch_logging_options.value.log_stream_name
          }
        }
        compression_format  = iceberg_configuration.value.s3_configuration.compression_format
        error_output_prefix = iceberg_configuration.value.s3_configuration.error_output_prefix
        kms_key_arn         = iceberg_configuration.value.s3_configuration.kms_key_arn
        prefix              = iceberg_configuration.value.s3_configuration.prefix
        role_arn            = iceberg_configuration.value.s3_configuration.role_arn
      }
    }
  }

  dynamic "kinesis_source_configuration" {
    for_each = each.value.kinesis_source_configuration != null ? [each.value.kinesis_source_configuration] : []
    content {
      kinesis_stream_arn = kinesis_source_configuration.value.kinesis_stream_arn
      role_arn           = kinesis_source_configuration.value.role_arn
    }
  }

  dynamic "msk_source_configuration" {
    for_each = each.value.msk_source_configuration != null ? [each.value.msk_source_configuration] : []
    content {
      authentication_configuration {
        connectivity = msk_source_configuration.value.authentication_configuration.connectivity
        role_arn     = msk_source_configuration.value.authentication_configuration.role_arn
      }
      msk_cluster_arn     = msk_source_configuration.value.msk_cluster_arn
      read_from_timestamp = msk_source_configuration.value.read_from_timestamp
      topic_name          = msk_source_configuration.value.topic_name
    }
  }

  dynamic "opensearch_configuration" {
    for_each = each.value.opensearch_configuration != null ? [each.value.opensearch_configuration] : []
    content {
      buffering_interval = opensearch_configuration.value.buffering_interval
      buffering_size     = opensearch_configuration.value.buffering_size
      dynamic "cloudwatch_logging_options" {
        for_each = opensearch_configuration.value.cloudwatch_logging_options != null ? [opensearch_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      cluster_endpoint = opensearch_configuration.value.cluster_endpoint
      dynamic "document_id_options" {
        for_each = opensearch_configuration.value.document_id_options != null ? [opensearch_configuration.value.document_id_options] : []
        content {
          default_document_id_format = document_id_options.value.default_document_id_format
        }
      }
      domain_arn            = opensearch_configuration.value.domain_arn
      index_name            = opensearch_configuration.value.index_name
      index_rotation_period = opensearch_configuration.value.index_rotation_period
      dynamic "processing_configuration" {
        for_each = opensearch_configuration.value.processing_configuration != null ? [opensearch_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      retry_duration = opensearch_configuration.value.retry_duration
      role_arn       = opensearch_configuration.value.role_arn
      s3_backup_mode = opensearch_configuration.value.s3_backup_mode
      s3_configuration {
        bucket_arn         = opensearch_configuration.value.s3_configuration.bucket_arn
        buffering_interval = opensearch_configuration.value.s3_configuration.buffering_interval
        buffering_size     = opensearch_configuration.value.s3_configuration.buffering_size
        dynamic "cloudwatch_logging_options" {
          for_each = opensearch_configuration.value.s3_configuration.cloudwatch_logging_options != null ? [opensearch_configuration.value.s3_configuration.cloudwatch_logging_options] : []
          content {
            enabled         = cloudwatch_logging_options.value.enabled
            log_group_name  = cloudwatch_logging_options.value.log_group_name
            log_stream_name = cloudwatch_logging_options.value.log_stream_name
          }
        }
        compression_format  = opensearch_configuration.value.s3_configuration.compression_format
        error_output_prefix = opensearch_configuration.value.s3_configuration.error_output_prefix
        kms_key_arn         = opensearch_configuration.value.s3_configuration.kms_key_arn
        prefix              = opensearch_configuration.value.s3_configuration.prefix
        role_arn            = opensearch_configuration.value.s3_configuration.role_arn
      }
      type_name = opensearch_configuration.value.type_name
      dynamic "vpc_config" {
        for_each = opensearch_configuration.value.vpc_config != null ? [opensearch_configuration.value.vpc_config] : []
        content {
          role_arn           = vpc_config.value.role_arn
          security_group_ids = vpc_config.value.security_group_ids
          subnet_ids         = vpc_config.value.subnet_ids
        }
      }
    }
  }

  dynamic "opensearchserverless_configuration" {
    for_each = each.value.opensearchserverless_configuration != null ? [each.value.opensearchserverless_configuration] : []
    content {
      buffering_interval = opensearchserverless_configuration.value.buffering_interval
      buffering_size     = opensearchserverless_configuration.value.buffering_size
      dynamic "cloudwatch_logging_options" {
        for_each = opensearchserverless_configuration.value.cloudwatch_logging_options != null ? [opensearchserverless_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      collection_endpoint = opensearchserverless_configuration.value.collection_endpoint
      index_name          = opensearchserverless_configuration.value.index_name
      dynamic "processing_configuration" {
        for_each = opensearchserverless_configuration.value.processing_configuration != null ? [opensearchserverless_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      retry_duration = opensearchserverless_configuration.value.retry_duration
      role_arn       = opensearchserverless_configuration.value.role_arn
      s3_backup_mode = opensearchserverless_configuration.value.s3_backup_mode
      s3_configuration {
        bucket_arn         = opensearchserverless_configuration.value.s3_configuration.bucket_arn
        buffering_interval = opensearchserverless_configuration.value.s3_configuration.buffering_interval
        buffering_size     = opensearchserverless_configuration.value.s3_configuration.buffering_size
        dynamic "cloudwatch_logging_options" {
          for_each = opensearchserverless_configuration.value.s3_configuration.cloudwatch_logging_options != null ? [opensearchserverless_configuration.value.s3_configuration.cloudwatch_logging_options] : []
          content {
            enabled         = cloudwatch_logging_options.value.enabled
            log_group_name  = cloudwatch_logging_options.value.log_group_name
            log_stream_name = cloudwatch_logging_options.value.log_stream_name
          }
        }
        compression_format  = opensearchserverless_configuration.value.s3_configuration.compression_format
        error_output_prefix = opensearchserverless_configuration.value.s3_configuration.error_output_prefix
        kms_key_arn         = opensearchserverless_configuration.value.s3_configuration.kms_key_arn
        prefix              = opensearchserverless_configuration.value.s3_configuration.prefix
        role_arn            = opensearchserverless_configuration.value.s3_configuration.role_arn
      }
      dynamic "vpc_config" {
        for_each = opensearchserverless_configuration.value.vpc_config != null ? [opensearchserverless_configuration.value.vpc_config] : []
        content {
          role_arn           = vpc_config.value.role_arn
          security_group_ids = vpc_config.value.security_group_ids
          subnet_ids         = vpc_config.value.subnet_ids
        }
      }
    }
  }

  dynamic "redshift_configuration" {
    for_each = each.value.redshift_configuration != null ? [each.value.redshift_configuration] : []
    content {
      dynamic "cloudwatch_logging_options" {
        for_each = redshift_configuration.value.cloudwatch_logging_options != null ? [redshift_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      cluster_jdbcurl    = redshift_configuration.value.cluster_jdbcurl
      copy_options       = redshift_configuration.value.copy_options
      data_table_columns = redshift_configuration.value.data_table_columns
      data_table_name    = redshift_configuration.value.data_table_name
      password           = redshift_configuration.value.password
      dynamic "processing_configuration" {
        for_each = redshift_configuration.value.processing_configuration != null ? [redshift_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      retry_duration = redshift_configuration.value.retry_duration
      role_arn       = redshift_configuration.value.role_arn
      dynamic "s3_backup_configuration" {
        for_each = redshift_configuration.value.s3_backup_configuration != null ? [redshift_configuration.value.s3_backup_configuration] : []
        content {
          bucket_arn         = s3_backup_configuration.value.bucket_arn
          buffering_interval = s3_backup_configuration.value.buffering_interval
          buffering_size     = s3_backup_configuration.value.buffering_size
          dynamic "cloudwatch_logging_options" {
            for_each = s3_backup_configuration.value.cloudwatch_logging_options != null ? [s3_backup_configuration.value.cloudwatch_logging_options] : []
            content {
              enabled         = cloudwatch_logging_options.value.enabled
              log_group_name  = cloudwatch_logging_options.value.log_group_name
              log_stream_name = cloudwatch_logging_options.value.log_stream_name
            }
          }
          compression_format  = s3_backup_configuration.value.compression_format
          error_output_prefix = s3_backup_configuration.value.error_output_prefix
          kms_key_arn         = s3_backup_configuration.value.kms_key_arn
          prefix              = s3_backup_configuration.value.prefix
          role_arn            = s3_backup_configuration.value.role_arn
        }
      }
      s3_backup_mode = redshift_configuration.value.s3_backup_mode
      s3_configuration {
        bucket_arn         = redshift_configuration.value.s3_configuration.bucket_arn
        buffering_interval = redshift_configuration.value.s3_configuration.buffering_interval
        buffering_size     = redshift_configuration.value.s3_configuration.buffering_size
        dynamic "cloudwatch_logging_options" {
          for_each = redshift_configuration.value.s3_configuration.cloudwatch_logging_options != null ? [redshift_configuration.value.s3_configuration.cloudwatch_logging_options] : []
          content {
            enabled         = cloudwatch_logging_options.value.enabled
            log_group_name  = cloudwatch_logging_options.value.log_group_name
            log_stream_name = cloudwatch_logging_options.value.log_stream_name
          }
        }
        compression_format  = redshift_configuration.value.s3_configuration.compression_format
        error_output_prefix = redshift_configuration.value.s3_configuration.error_output_prefix
        kms_key_arn         = redshift_configuration.value.s3_configuration.kms_key_arn
        prefix              = redshift_configuration.value.s3_configuration.prefix
        role_arn            = redshift_configuration.value.s3_configuration.role_arn
      }
      dynamic "secrets_manager_configuration" {
        for_each = redshift_configuration.value.secrets_manager_configuration != null ? [redshift_configuration.value.secrets_manager_configuration] : []
        content {
          enabled    = secrets_manager_configuration.value.enabled
          role_arn   = secrets_manager_configuration.value.role_arn
          secret_arn = secrets_manager_configuration.value.secret_arn
        }
      }
      username = redshift_configuration.value.username
    }
  }

  dynamic "server_side_encryption" {
    for_each = each.value.server_side_encryption != null ? [each.value.server_side_encryption] : []
    content {
      enabled  = server_side_encryption.value.enabled
      key_arn  = server_side_encryption.value.key_arn
      key_type = server_side_encryption.value.key_type
    }
  }

  dynamic "snowflake_configuration" {
    for_each = each.value.snowflake_configuration != null ? [each.value.snowflake_configuration] : []
    content {
      account_url        = snowflake_configuration.value.account_url
      buffering_interval = snowflake_configuration.value.buffering_interval
      buffering_size     = snowflake_configuration.value.buffering_size
      dynamic "cloudwatch_logging_options" {
        for_each = snowflake_configuration.value.cloudwatch_logging_options != null ? [snowflake_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      content_column_name  = snowflake_configuration.value.content_column_name
      data_loading_option  = snowflake_configuration.value.data_loading_option
      database             = snowflake_configuration.value.database
      key_passphrase       = snowflake_configuration.value.key_passphrase
      metadata_column_name = snowflake_configuration.value.metadata_column_name
      private_key          = snowflake_configuration.value.private_key
      dynamic "processing_configuration" {
        for_each = snowflake_configuration.value.processing_configuration != null ? [snowflake_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      retry_duration = snowflake_configuration.value.retry_duration
      role_arn       = snowflake_configuration.value.role_arn
      s3_backup_mode = snowflake_configuration.value.s3_backup_mode
      s3_configuration {
        bucket_arn         = snowflake_configuration.value.s3_configuration.bucket_arn
        buffering_interval = snowflake_configuration.value.s3_configuration.buffering_interval
        buffering_size     = snowflake_configuration.value.s3_configuration.buffering_size
        dynamic "cloudwatch_logging_options" {
          for_each = snowflake_configuration.value.s3_configuration.cloudwatch_logging_options != null ? [snowflake_configuration.value.s3_configuration.cloudwatch_logging_options] : []
          content {
            enabled         = cloudwatch_logging_options.value.enabled
            log_group_name  = cloudwatch_logging_options.value.log_group_name
            log_stream_name = cloudwatch_logging_options.value.log_stream_name
          }
        }
        compression_format  = snowflake_configuration.value.s3_configuration.compression_format
        error_output_prefix = snowflake_configuration.value.s3_configuration.error_output_prefix
        kms_key_arn         = snowflake_configuration.value.s3_configuration.kms_key_arn
        prefix              = snowflake_configuration.value.s3_configuration.prefix
        role_arn            = snowflake_configuration.value.s3_configuration.role_arn
      }
      schema = snowflake_configuration.value.schema
      dynamic "secrets_manager_configuration" {
        for_each = snowflake_configuration.value.secrets_manager_configuration != null ? [snowflake_configuration.value.secrets_manager_configuration] : []
        content {
          enabled    = secrets_manager_configuration.value.enabled
          role_arn   = secrets_manager_configuration.value.role_arn
          secret_arn = secrets_manager_configuration.value.secret_arn
        }
      }
      dynamic "snowflake_role_configuration" {
        for_each = snowflake_configuration.value.snowflake_role_configuration != null ? [snowflake_configuration.value.snowflake_role_configuration] : []
        content {
          enabled        = snowflake_role_configuration.value.enabled
          snowflake_role = snowflake_role_configuration.value.snowflake_role
        }
      }
      dynamic "snowflake_vpc_configuration" {
        for_each = snowflake_configuration.value.snowflake_vpc_configuration != null ? [snowflake_configuration.value.snowflake_vpc_configuration] : []
        content {
          private_link_vpce_id = snowflake_vpc_configuration.value.private_link_vpce_id
        }
      }
      table = snowflake_configuration.value.table
      user  = snowflake_configuration.value.user
    }
  }

  dynamic "splunk_configuration" {
    for_each = each.value.splunk_configuration != null ? [each.value.splunk_configuration] : []
    content {
      buffering_interval = splunk_configuration.value.buffering_interval
      buffering_size     = splunk_configuration.value.buffering_size
      dynamic "cloudwatch_logging_options" {
        for_each = splunk_configuration.value.cloudwatch_logging_options != null ? [splunk_configuration.value.cloudwatch_logging_options] : []
        content {
          enabled         = cloudwatch_logging_options.value.enabled
          log_group_name  = cloudwatch_logging_options.value.log_group_name
          log_stream_name = cloudwatch_logging_options.value.log_stream_name
        }
      }
      hec_acknowledgment_timeout = splunk_configuration.value.hec_acknowledgment_timeout
      hec_endpoint               = splunk_configuration.value.hec_endpoint
      hec_endpoint_type          = splunk_configuration.value.hec_endpoint_type
      hec_token                  = splunk_configuration.value.hec_token
      dynamic "processing_configuration" {
        for_each = splunk_configuration.value.processing_configuration != null ? [splunk_configuration.value.processing_configuration] : []
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors != null ? processing_configuration.value.processors : []
            content {
              dynamic "parameters" {
                for_each = processors.value.parameters != null ? processors.value.parameters : []
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }
              }
              type = processors.value.type
            }
          }
        }
      }
      retry_duration = splunk_configuration.value.retry_duration
      s3_backup_mode = splunk_configuration.value.s3_backup_mode
      s3_configuration {
        bucket_arn         = splunk_configuration.value.s3_configuration.bucket_arn
        buffering_interval = splunk_configuration.value.s3_configuration.buffering_interval
        buffering_size     = splunk_configuration.value.s3_configuration.buffering_size
        dynamic "cloudwatch_logging_options" {
          for_each = splunk_configuration.value.s3_configuration.cloudwatch_logging_options != null ? [splunk_configuration.value.s3_configuration.cloudwatch_logging_options] : []
          content {
            enabled         = cloudwatch_logging_options.value.enabled
            log_group_name  = cloudwatch_logging_options.value.log_group_name
            log_stream_name = cloudwatch_logging_options.value.log_stream_name
          }
        }
        compression_format  = splunk_configuration.value.s3_configuration.compression_format
        error_output_prefix = splunk_configuration.value.s3_configuration.error_output_prefix
        kms_key_arn         = splunk_configuration.value.s3_configuration.kms_key_arn
        prefix              = splunk_configuration.value.s3_configuration.prefix
        role_arn            = splunk_configuration.value.s3_configuration.role_arn
      }
      dynamic "secrets_manager_configuration" {
        for_each = splunk_configuration.value.secrets_manager_configuration != null ? [splunk_configuration.value.secrets_manager_configuration] : []
        content {
          enabled    = secrets_manager_configuration.value.enabled
          role_arn   = secrets_manager_configuration.value.role_arn
          secret_arn = secrets_manager_configuration.value.secret_arn
        }
      }
    }
  }
}

