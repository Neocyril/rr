variable "server_ip" {
  description = "The IP address of the server where the probe will be deployed."
}

variable "ssh_user" {
  description = "The SSH user to connect to the server."
}

variable "private_key_path" {
  description = "The path to the private SSH key used for authentication."
}

variable "api_server" {
  description = "The address of the API server for the Synthetic Monitoring Agent."
}

variable "api_token" {
  description = "The API token for authenticating with the API server."
}
