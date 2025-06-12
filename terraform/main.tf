resource "null_resource" "deploy_probe" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = var.server_ip
    }

    inline = [
      # Ensure Docker Compose is available
      "which docker-compose || sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",

      # Clone or pull the latest repo
      "mkdir -p ~/grafana-private-probe",
      "cd ~/grafana-private-probe",
      "rm -rf *",
      "git clone https://github.com/${GITHUB_REPOSITORY}.git .",

      # Create config directory if not present
      "mkdir -p ./probe-config",

      # Export token and start the container using docker-compose
      "export PROBE_TOKEN='${var.api_token}'",
      "docker-compose pull",
      "docker-compose down",
      "docker-compose up -d"
    ]
  }
}
