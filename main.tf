resource "null_resource" "docker_compose" {
  provisioner "local-exec" {
    working_dir = path.module
    command = <<EOT
      export POSTGRES_USER="${var.postgres_user}"
      export POSTGRES_PASSWORD="${var.postgres_password}"
      export POSTGRES_DB="${var.postgres_db}"
      export N8N_ENCRYPTION_KEY="${var.n8n_encryption_key}"
      export N8N_USER_MANAGEMENT_JWT_SECRET="${var.n8n_user_management_jwt_secret}"
      export N8N_DEFAULT_BINARY_DATA_MODE="${var.n8n_default_binary_data_mode}"
      export N8N_SECURE_COOKIE="false"
      sudo -E docker compose -f ${path.module}/docker-compose.yml up -d
    EOT
  }

  lifecycle {
    create_before_destroy = true
  }

  provisioner "local-exec" {
    when        = destroy
    working_dir = path.module
    command     = "sudo docker compose -f ${path.module}/docker-compose.yml down"
  }
}
