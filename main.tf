resource "null_resource" "docker_compose" {
  provisioner "local-exec" {
    command = <<EOT
      POSTGRES_USER=${var.postgres_user} \
      POSTGRES_PASSWORD=${var.postgres_password} \
      POSTGRES_DB=${var.postgres_db} \
      N8N_ENCRYPTION_KEY=${var.n8n_encryption_key} \
      N8N_USER_MANAGEMENT_JWT_SECRET=${var.n8n_user_management_jwt_secret} \
      N8N_DEFAULT_BINARY_DATA_MODE=${var.n8n_default_binary_data_mode} \
      N8N_SECURE_COOKIE="false" \
      sudo -E docker compose -f ${path.module}/docker-compose.yml up -d
    EOT
    working_dir = path.module
  }

  lifecycle {
    create_before_destroy = true
  }

  provisioner "local-exec" {
    when    = destroy
    command = "sudo docker compose -f ${path.module}/docker-compose.yml down"
    working_dir = path.module
  }
}
