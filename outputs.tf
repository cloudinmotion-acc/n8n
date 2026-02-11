output "n8n_output" {
  description = "N8N output"
  value = {
    "n8n_url"                        = "http://${var.bastion_host_output.public_dns}:5678"
    "n8n_ip"                         = var.bastion_host_output.public_ip
    "n8n_port"                       = 5678
    "POSTGRES_USER"                  = var.postgres_user
    "POSTGRES_PASSWORD"              = nonsensitive(var.postgres_password)
    "POSTGRES_DB"                    = var.postgres_db
    "N8N_ENCRYPTION_KEY"             = nonsensitive(var.n8n_encryption_key)
    "N8N_USER_MANAGEMENT_JWT_SECRET" = nonsensitive(var.n8n_user_management_jwt_secret)
    "N8N_DEFAULT_BINARY_DATA_MODE"   = var.n8n_default_binary_data_mode
  }
}

output "mpp_report" {
  description = "MPP report"
    value = {
    "n8n_url"                        = "http://${var.bastion_host_output.public_dns}:5678"
    "n8n_ip"                         = var.bastion_host_output.public_ip
    "n8n_port"                       = 5678
    "POSTGRES_USER"                  = var.postgres_user
    "POSTGRES_PASSWORD"              = nonsensitive(var.postgres_password)
    "POSTGRES_DB"                    = var.postgres_db
    "N8N_ENCRYPTION_KEY"             = nonsensitive(var.n8n_encryption_key)
    "N8N_USER_MANAGEMENT_JWT_SECRET" = nonsensitive(var.n8n_user_management_jwt_secret)
    "N8N_DEFAULT_BINARY_DATA_MODE"   = var.n8n_default_binary_data_mode
  }
}