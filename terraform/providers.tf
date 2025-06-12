provider "null" {}

provider "local" {}

provider "ssh" {
  host        = var.server_ip
  user        = var.ssh_user
  private_key = file(var.private_key_path)
}