variable "kinesis_firehose_delivery_streams" {
  description = <<EOT
Map of kinesis_firehose_delivery_streams, attributes below
Required:
    - destination
    - name
Optional:
    - arn
    - destination_id
    - region
    - tags
    - tags_all
    - version_id
    - elasticsearch_configuration (block):
        - buffering_interval (optional)
        - buffering_size (optional)
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - cluster_endpoint (optional)
        - domain_arn (optional)
        - index_name (required)
        - index_rotation_period (optional)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - retry_duration (optional)
        - role_arn (required)
        - s3_backup_mode (optional)
        - s3_configuration (required, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - type_name (optional)
        - vpc_config (optional, block):
            - role_arn (required)
            - security_group_ids (required)
            - subnet_ids (required)
    - extended_s3_configuration (block):
        - bucket_arn (required)
        - buffering_interval (optional)
        - buffering_size (optional)
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - compression_format (optional)
        - custom_time_zone (optional)
        - data_format_conversion_configuration (optional, block):
            - enabled (optional)
            - input_format_configuration (required, block):
                - deserializer (required, block):
                    - hive_json_ser_de (optional, block):
                        - timestamp_formats (optional)
                    - open_x_json_ser_de (optional, block):
                        - case_insensitive (optional)
                        - column_to_json_key_mappings (optional)
                        - convert_dots_in_json_keys_to_underscores (optional)
            - output_format_configuration (required, block):
                - serializer (required, block):
                    - orc_ser_de (optional, block):
                        - block_size_bytes (optional)
                        - bloom_filter_columns (optional)
                        - bloom_filter_false_positive_probability (optional)
                        - compression (optional)
                        - dictionary_key_threshold (optional)
                        - enable_padding (optional)
                        - format_version (optional)
                        - padding_tolerance (optional)
                        - row_index_stride (optional)
                        - stripe_size_bytes (optional)
                    - parquet_ser_de (optional, block):
                        - block_size_bytes (optional)
                        - compression (optional)
                        - enable_dictionary_compression (optional)
                        - max_padding_bytes (optional)
                        - page_size_bytes (optional)
                        - writer_version (optional)
            - schema_configuration (required, block):
                - catalog_id (optional)
                - database_name (required)
                - region (optional)
                - role_arn (required)
                - table_name (required)
                - version_id (optional)
        - dynamic_partitioning_configuration (optional, block):
            - enabled (optional)
            - retry_duration (optional)
        - error_output_prefix (optional)
        - file_extension (optional)
        - kms_key_arn (optional)
        - prefix (optional)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - role_arn (required)
        - s3_backup_configuration (optional, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - s3_backup_mode (optional)
    - http_endpoint_configuration (block):
        - access_key (optional)
        - buffering_interval (optional)
        - buffering_size (optional)
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - name (optional)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - request_configuration (optional, block):
            - common_attributes (optional, block):
                - name (required)
                - value (required)
            - content_encoding (optional)
        - retry_duration (optional)
        - role_arn (optional)
        - s3_backup_mode (optional)
        - s3_configuration (required, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - secrets_manager_configuration (optional, block):
            - enabled (optional)
            - role_arn (optional)
            - secret_arn (optional)
        - url (required)
    - iceberg_configuration (block):
        - append_only (optional)
        - buffering_interval (optional)
        - buffering_size (optional)
        - catalog_arn (required)
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - destination_table_configuration (optional, block):
            - database_name (required)
            - s3_error_output_prefix (optional)
            - table_name (required)
            - unique_keys (optional)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - retry_duration (optional)
        - role_arn (required)
        - s3_backup_mode (optional)
        - s3_configuration (required, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
    - kinesis_source_configuration (block):
        - kinesis_stream_arn (required)
        - role_arn (required)
    - msk_source_configuration (block):
        - authentication_configuration (required, block):
            - connectivity (required)
            - role_arn (required)
        - msk_cluster_arn (required)
        - read_from_timestamp (optional)
        - topic_name (required)
    - opensearch_configuration (block):
        - buffering_interval (optional)
        - buffering_size (optional)
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - cluster_endpoint (optional)
        - document_id_options (optional, block):
            - default_document_id_format (required)
        - domain_arn (optional)
        - index_name (required)
        - index_rotation_period (optional)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - retry_duration (optional)
        - role_arn (required)
        - s3_backup_mode (optional)
        - s3_configuration (required, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - type_name (optional)
        - vpc_config (optional, block):
            - role_arn (required)
            - security_group_ids (required)
            - subnet_ids (required)
    - opensearchserverless_configuration (block):
        - buffering_interval (optional)
        - buffering_size (optional)
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - collection_endpoint (required)
        - index_name (required)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - retry_duration (optional)
        - role_arn (required)
        - s3_backup_mode (optional)
        - s3_configuration (required, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - vpc_config (optional, block):
            - role_arn (required)
            - security_group_ids (required)
            - subnet_ids (required)
    - redshift_configuration (block):
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - cluster_jdbcurl (required)
        - copy_options (optional)
        - data_table_columns (optional)
        - data_table_name (required)
        - password (optional)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - retry_duration (optional)
        - role_arn (required)
        - s3_backup_configuration (optional, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - s3_backup_mode (optional)
        - s3_configuration (required, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - secrets_manager_configuration (optional, block):
            - enabled (optional)
            - role_arn (optional)
            - secret_arn (optional)
        - username (optional)
    - server_side_encryption (block):
        - enabled (optional)
        - key_arn (optional)
        - key_type (optional)
    - snowflake_configuration (block):
        - account_url (required)
        - buffering_interval (optional)
        - buffering_size (optional)
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - content_column_name (optional)
        - data_loading_option (optional)
        - database (required)
        - key_passphrase (optional)
        - metadata_column_name (optional)
        - private_key (optional)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - retry_duration (optional)
        - role_arn (required)
        - s3_backup_mode (optional)
        - s3_configuration (required, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - schema (required)
        - secrets_manager_configuration (optional, block):
            - enabled (optional)
            - role_arn (optional)
            - secret_arn (optional)
        - snowflake_role_configuration (optional, block):
            - enabled (optional)
            - snowflake_role (optional)
        - snowflake_vpc_configuration (optional, block):
            - private_link_vpce_id (required)
        - table (required)
        - user (optional)
    - splunk_configuration (block):
        - buffering_interval (optional)
        - buffering_size (optional)
        - cloudwatch_logging_options (optional, block):
            - enabled (optional)
            - log_group_name (optional)
            - log_stream_name (optional)
        - hec_acknowledgment_timeout (optional)
        - hec_endpoint (required)
        - hec_endpoint_type (optional)
        - hec_token (optional)
        - processing_configuration (optional, block):
            - enabled (optional)
            - processors (optional, block):
                - parameters (optional, block):
                    - parameter_name (required)
                    - parameter_value (required)
                - type (required)
        - retry_duration (optional)
        - s3_backup_mode (optional)
        - s3_configuration (required, block):
            - bucket_arn (required)
            - buffering_interval (optional)
            - buffering_size (optional)
            - cloudwatch_logging_options (optional, block):
                - enabled (optional)
                - log_group_name (optional)
                - log_stream_name (optional)
            - compression_format (optional)
            - error_output_prefix (optional)
            - kms_key_arn (optional)
            - prefix (optional)
            - role_arn (required)
        - secrets_manager_configuration (optional, block):
            - enabled (optional)
            - role_arn (optional)
            - secret_arn (optional)
EOT

  type = map(object({
    destination    = string
    name           = string
    arn            = optional(string)
    destination_id = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    version_id     = optional(string)
    elasticsearch_configuration = optional(object({
      buffering_interval = optional(number)
      buffering_size     = optional(number)
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      cluster_endpoint      = optional(string)
      domain_arn            = optional(string)
      index_name            = string
      index_rotation_period = optional(string)
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      retry_duration = optional(number)
      role_arn       = string
      s3_backup_mode = optional(string)
      s3_configuration = object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      })
      type_name = optional(string)
      vpc_config = optional(object({
        role_arn           = string
        security_group_ids = set(string)
        subnet_ids         = set(string)
      }))
    }))
    extended_s3_configuration = optional(object({
      bucket_arn         = string
      buffering_interval = optional(number)
      buffering_size     = optional(number)
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      compression_format = optional(string)
      custom_time_zone   = optional(string)
      data_format_conversion_configuration = optional(object({
        enabled = optional(bool)
        input_format_configuration = object({
          deserializer = object({
            hive_json_ser_de = optional(object({
              timestamp_formats = optional(list(string))
            }))
            open_x_json_ser_de = optional(object({
              case_insensitive                         = optional(bool)
              column_to_json_key_mappings              = optional(map(string))
              convert_dots_in_json_keys_to_underscores = optional(bool)
            }))
          })
        })
        output_format_configuration = object({
          serializer = object({
            orc_ser_de = optional(object({
              block_size_bytes                        = optional(number)
              bloom_filter_columns                    = optional(list(string))
              bloom_filter_false_positive_probability = optional(number)
              compression                             = optional(string)
              dictionary_key_threshold                = optional(number)
              enable_padding                          = optional(bool)
              format_version                          = optional(string)
              padding_tolerance                       = optional(number)
              row_index_stride                        = optional(number)
              stripe_size_bytes                       = optional(number)
            }))
            parquet_ser_de = optional(object({
              block_size_bytes              = optional(number)
              compression                   = optional(string)
              enable_dictionary_compression = optional(bool)
              max_padding_bytes             = optional(number)
              page_size_bytes               = optional(number)
              writer_version                = optional(string)
            }))
          })
        })
        schema_configuration = object({
          catalog_id    = optional(string)
          database_name = string
          region        = optional(string)
          role_arn      = string
          table_name    = string
          version_id    = optional(string)
        })
      }))
      dynamic_partitioning_configuration = optional(object({
        enabled        = optional(bool)
        retry_duration = optional(number)
      }))
      error_output_prefix = optional(string)
      file_extension      = optional(string)
      kms_key_arn         = optional(string)
      prefix              = optional(string)
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      role_arn = string
      s3_backup_configuration = optional(object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      }))
      s3_backup_mode = optional(string)
    }))
    http_endpoint_configuration = optional(object({
      access_key         = optional(string)
      buffering_interval = optional(number)
      buffering_size     = optional(number)
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      name = optional(string)
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      request_configuration = optional(object({
        common_attributes = optional(list(object({
          name  = string
          value = string
        })))
        content_encoding = optional(string)
      }))
      retry_duration = optional(number)
      role_arn       = optional(string)
      s3_backup_mode = optional(string)
      s3_configuration = object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      })
      secrets_manager_configuration = optional(object({
        enabled    = optional(bool)
        role_arn   = optional(string)
        secret_arn = optional(string)
      }))
      url = string
    }))
    iceberg_configuration = optional(object({
      append_only        = optional(bool)
      buffering_interval = optional(number)
      buffering_size     = optional(number)
      catalog_arn        = string
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      destination_table_configuration = optional(list(object({
        database_name          = string
        s3_error_output_prefix = optional(string)
        table_name             = string
        unique_keys            = optional(list(string))
      })))
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      retry_duration = optional(number)
      role_arn       = string
      s3_backup_mode = optional(string)
      s3_configuration = object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      })
    }))
    kinesis_source_configuration = optional(object({
      kinesis_stream_arn = string
      role_arn           = string
    }))
    msk_source_configuration = optional(object({
      authentication_configuration = object({
        connectivity = string
        role_arn     = string
      })
      msk_cluster_arn     = string
      read_from_timestamp = optional(string)
      topic_name          = string
    }))
    opensearch_configuration = optional(object({
      buffering_interval = optional(number)
      buffering_size     = optional(number)
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      cluster_endpoint = optional(string)
      document_id_options = optional(object({
        default_document_id_format = string
      }))
      domain_arn            = optional(string)
      index_name            = string
      index_rotation_period = optional(string)
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      retry_duration = optional(number)
      role_arn       = string
      s3_backup_mode = optional(string)
      s3_configuration = object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      })
      type_name = optional(string)
      vpc_config = optional(object({
        role_arn           = string
        security_group_ids = set(string)
        subnet_ids         = set(string)
      }))
    }))
    opensearchserverless_configuration = optional(object({
      buffering_interval = optional(number)
      buffering_size     = optional(number)
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      collection_endpoint = string
      index_name          = string
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      retry_duration = optional(number)
      role_arn       = string
      s3_backup_mode = optional(string)
      s3_configuration = object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      })
      vpc_config = optional(object({
        role_arn           = string
        security_group_ids = set(string)
        subnet_ids         = set(string)
      }))
    }))
    redshift_configuration = optional(object({
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      cluster_jdbcurl    = string
      copy_options       = optional(string)
      data_table_columns = optional(string)
      data_table_name    = string
      password           = optional(string)
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      retry_duration = optional(number)
      role_arn       = string
      s3_backup_configuration = optional(object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      }))
      s3_backup_mode = optional(string)
      s3_configuration = object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      })
      secrets_manager_configuration = optional(object({
        enabled    = optional(bool)
        role_arn   = optional(string)
        secret_arn = optional(string)
      }))
      username = optional(string)
    }))
    server_side_encryption = optional(object({
      enabled  = optional(bool)
      key_arn  = optional(string)
      key_type = optional(string)
    }))
    snowflake_configuration = optional(object({
      account_url        = string
      buffering_interval = optional(number)
      buffering_size     = optional(number)
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      content_column_name  = optional(string)
      data_loading_option  = optional(string)
      database             = string
      key_passphrase       = optional(string)
      metadata_column_name = optional(string)
      private_key          = optional(string)
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      retry_duration = optional(number)
      role_arn       = string
      s3_backup_mode = optional(string)
      s3_configuration = object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      })
      schema = string
      secrets_manager_configuration = optional(object({
        enabled    = optional(bool)
        role_arn   = optional(string)
        secret_arn = optional(string)
      }))
      snowflake_role_configuration = optional(object({
        enabled        = optional(bool)
        snowflake_role = optional(string)
      }))
      snowflake_vpc_configuration = optional(object({
        private_link_vpce_id = string
      }))
      table = string
      user  = optional(string)
    }))
    splunk_configuration = optional(object({
      buffering_interval = optional(number)
      buffering_size     = optional(number)
      cloudwatch_logging_options = optional(object({
        enabled         = optional(bool)
        log_group_name  = optional(string)
        log_stream_name = optional(string)
      }))
      hec_acknowledgment_timeout = optional(number)
      hec_endpoint               = string
      hec_endpoint_type          = optional(string)
      hec_token                  = optional(string)
      processing_configuration = optional(object({
        enabled = optional(bool)
        processors = optional(list(object({
          parameters = optional(list(object({
            parameter_name  = string
            parameter_value = string
          })))
          type = string
        })))
      }))
      retry_duration = optional(number)
      s3_backup_mode = optional(string)
      s3_configuration = object({
        bucket_arn         = string
        buffering_interval = optional(number)
        buffering_size     = optional(number)
        cloudwatch_logging_options = optional(object({
          enabled         = optional(bool)
          log_group_name  = optional(string)
          log_stream_name = optional(string)
        }))
        compression_format  = optional(string)
        error_output_prefix = optional(string)
        kms_key_arn         = optional(string)
        prefix              = optional(string)
        role_arn            = string
      })
      secrets_manager_configuration = optional(object({
        enabled    = optional(bool)
        role_arn   = optional(string)
        secret_arn = optional(string)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.elasticsearch_configuration == null || (v.elasticsearch_configuration.buffering_interval == null || (v.elasticsearch_configuration.buffering_interval >= 0 && v.elasticsearch_configuration.buffering_interval <= 900))
      )
    ])
    error_message = "must be between 0 and 900"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.elasticsearch_configuration == null || (v.elasticsearch_configuration.buffering_size == null || (v.elasticsearch_configuration.buffering_size >= 1 && v.elasticsearch_configuration.buffering_size <= 100))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.elasticsearch_configuration == null || (v.elasticsearch_configuration.retry_duration == null || (v.elasticsearch_configuration.retry_duration >= 0 && v.elasticsearch_configuration.retry_duration <= 7200))
      )
    ])
    error_message = "must be between 0 and 7200"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.elasticsearch_configuration == null || (v.elasticsearch_configuration.type_name == null || (length(v.elasticsearch_configuration.type_name) >= 0 && length(v.elasticsearch_configuration.type_name) <= 100))
      )
    ])
    error_message = "must be between 0 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.extended_s3_configuration == null || (v.extended_s3_configuration.custom_time_zone == null || (length(v.extended_s3_configuration.custom_time_zone) >= 0 && length(v.extended_s3_configuration.custom_time_zone) <= 50))
      )
    ])
    error_message = "must be between 0 and 50 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.extended_s3_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de.block_size_bytes == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de.block_size_bytes >= 67108864))))
      )
    ])
    error_message = "must be at least 67108864"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.extended_s3_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de.row_index_stride == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de.row_index_stride >= 1000))))
      )
    ])
    error_message = "must be at least 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.extended_s3_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de.stripe_size_bytes == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.orc_ser_de.stripe_size_bytes >= 8388608))))
      )
    ])
    error_message = "must be at least 8388608"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.extended_s3_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.parquet_ser_de == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.parquet_ser_de.block_size_bytes == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.parquet_ser_de.block_size_bytes >= 67108864))))
      )
    ])
    error_message = "must be at least 67108864"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.extended_s3_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.parquet_ser_de == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.parquet_ser_de.page_size_bytes == null || (v.extended_s3_configuration.data_format_conversion_configuration.output_format_configuration.serializer.parquet_ser_de.page_size_bytes >= 65536))))
      )
    ])
    error_message = "must be at least 65536"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.extended_s3_configuration == null || (v.extended_s3_configuration.error_output_prefix == null || (length(v.extended_s3_configuration.error_output_prefix) >= 0 && length(v.extended_s3_configuration.error_output_prefix) <= 1024))
      )
    ])
    error_message = "must be between 0 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.extended_s3_configuration == null || (v.extended_s3_configuration.file_extension == null || ((length(v.extended_s3_configuration.file_extension) >= 0 && length(v.extended_s3_configuration.file_extension) <= 50) && (can(regex("^$|\\.[0-9a-z!\\-_.*'()]+", v.extended_s3_configuration.file_extension)))))
      )
    ])
    error_message = "all of: must be between 0 and 50 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.http_endpoint_configuration == null || (v.http_endpoint_configuration.buffering_interval == null || (v.http_endpoint_configuration.buffering_interval >= 0 && v.http_endpoint_configuration.buffering_interval <= 900))
      )
    ])
    error_message = "must be between 0 and 900"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.http_endpoint_configuration == null || (v.http_endpoint_configuration.buffering_size == null || (v.http_endpoint_configuration.buffering_size >= 1 && v.http_endpoint_configuration.buffering_size <= 100))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.http_endpoint_configuration == null || (v.http_endpoint_configuration.retry_duration == null || (v.http_endpoint_configuration.retry_duration >= 0 && v.http_endpoint_configuration.retry_duration <= 7200))
      )
    ])
    error_message = "must be between 0 and 7200"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.iceberg_configuration == null || (v.iceberg_configuration.retry_duration == null || (v.iceberg_configuration.retry_duration >= 0 && v.iceberg_configuration.retry_duration <= 7200))
      )
    ])
    error_message = "must be between 0 and 7200"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.opensearch_configuration == null || (v.opensearch_configuration.buffering_interval == null || (v.opensearch_configuration.buffering_interval >= 0 && v.opensearch_configuration.buffering_interval <= 900))
      )
    ])
    error_message = "must be between 0 and 900"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.opensearch_configuration == null || (v.opensearch_configuration.buffering_size == null || (v.opensearch_configuration.buffering_size >= 1 && v.opensearch_configuration.buffering_size <= 100))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.opensearch_configuration == null || (v.opensearch_configuration.retry_duration == null || (v.opensearch_configuration.retry_duration >= 0 && v.opensearch_configuration.retry_duration <= 7200))
      )
    ])
    error_message = "must be between 0 and 7200"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.opensearch_configuration == null || (v.opensearch_configuration.type_name == null || (length(v.opensearch_configuration.type_name) >= 0 && length(v.opensearch_configuration.type_name) <= 100))
      )
    ])
    error_message = "must be between 0 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.opensearchserverless_configuration == null || (v.opensearchserverless_configuration.buffering_interval == null || (v.opensearchserverless_configuration.buffering_interval >= 0 && v.opensearchserverless_configuration.buffering_interval <= 900))
      )
    ])
    error_message = "must be between 0 and 900"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.opensearchserverless_configuration == null || (v.opensearchserverless_configuration.buffering_size == null || (v.opensearchserverless_configuration.buffering_size >= 1 && v.opensearchserverless_configuration.buffering_size <= 100))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.opensearchserverless_configuration == null || (v.opensearchserverless_configuration.retry_duration == null || (v.opensearchserverless_configuration.retry_duration >= 0 && v.opensearchserverless_configuration.retry_duration <= 7200))
      )
    ])
    error_message = "must be between 0 and 7200"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.redshift_configuration == null || (v.redshift_configuration.retry_duration == null || (v.redshift_configuration.retry_duration >= 0 && v.redshift_configuration.retry_duration <= 7200))
      )
    ])
    error_message = "must be between 0 and 7200"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (v.snowflake_configuration.buffering_interval == null || (v.snowflake_configuration.buffering_interval >= 0 && v.snowflake_configuration.buffering_interval <= 900))
      )
    ])
    error_message = "must be between 0 and 900"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (v.snowflake_configuration.buffering_size == null || (v.snowflake_configuration.buffering_size >= 1 && v.snowflake_configuration.buffering_size <= 128))
      )
    ])
    error_message = "must be between 1 and 128"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (v.snowflake_configuration.content_column_name == null || (length(v.snowflake_configuration.content_column_name) >= 1 && length(v.snowflake_configuration.content_column_name) <= 255))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (v.snowflake_configuration.key_passphrase == null || (length(v.snowflake_configuration.key_passphrase) >= 7 && length(v.snowflake_configuration.key_passphrase) <= 255))
      )
    ])
    error_message = "must be between 7 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (v.snowflake_configuration.metadata_column_name == null || (length(v.snowflake_configuration.metadata_column_name) >= 1 && length(v.snowflake_configuration.metadata_column_name) <= 255))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (v.snowflake_configuration.retry_duration == null || (v.snowflake_configuration.retry_duration >= 0 && v.snowflake_configuration.retry_duration <= 7200))
      )
    ])
    error_message = "must be between 0 and 7200"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (v.snowflake_configuration.snowflake_role_configuration == null || (v.snowflake_configuration.snowflake_role_configuration.snowflake_role == null || (length(v.snowflake_configuration.snowflake_role_configuration.snowflake_role) >= 1 && length(v.snowflake_configuration.snowflake_role_configuration.snowflake_role) <= 255)))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (length(v.snowflake_configuration.table) >= 1 && length(v.snowflake_configuration.table) <= 255)
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.snowflake_configuration == null || (v.snowflake_configuration.user == null || (length(v.snowflake_configuration.user) >= 1 && length(v.snowflake_configuration.user) <= 255))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.splunk_configuration == null || (v.splunk_configuration.buffering_interval == null || (v.splunk_configuration.buffering_interval >= 0 && v.splunk_configuration.buffering_interval <= 60))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.splunk_configuration == null || (v.splunk_configuration.buffering_size == null || (v.splunk_configuration.buffering_size >= 1 && v.splunk_configuration.buffering_size <= 5))
      )
    ])
    error_message = "must be between 1 and 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.splunk_configuration == null || (v.splunk_configuration.hec_acknowledgment_timeout == null || (v.splunk_configuration.hec_acknowledgment_timeout >= 180 && v.splunk_configuration.hec_acknowledgment_timeout <= 600))
      )
    ])
    error_message = "must be between 180 and 600"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesis_firehose_delivery_streams : (
        v.splunk_configuration == null || (v.splunk_configuration.retry_duration == null || (v.splunk_configuration.retry_duration >= 0 && v.splunk_configuration.retry_duration <= 7200))
      )
    ])
    error_message = "must be between 0 and 7200"
  }
  # Note: 65 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

