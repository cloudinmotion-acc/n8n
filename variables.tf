variable "platform_output" {
  description = "Platform output"
  type        = any
  default     = null
}

variable "bastion_host_output" {
  description = "Bastion host output"
  type = object({
    public_dns = string
    public_ip  = string
  })
}

variable "initialization_output" {
  description = "Initialization output"
  type        = any
  default     = null
}

variable "kubernetes_cluster_output" {
  description = "kubernetes_cluster_output"
  type        = any
  default     = null
}

variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string
}
variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive = true
}
variable "postgres_db" {
  description = "PostgreSQL database name"
  type        = string
}
variable "n8n_encryption_key" {
  description = "N8N encryption key"
  type        = string
  sensitive = true

}
variable "n8n_user_management_jwt_secret" {
  description = "N8N user management JWT secret"
  type        = string
  sensitive = true
}
variable "n8n_default_binary_data_mode" {
  description = "filesystem"
  type        = string
}


   