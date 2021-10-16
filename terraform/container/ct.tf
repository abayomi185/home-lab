terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
        }
    }
}

provider "proxmox" {
    pm_api_url = "https://10.0.1.12:8006/api2/json"
}

variable "hostnames" {
  description = "Virtual machines to be created"
  type        = list(string)
  default     = ["s-node1", "s-node2", "s-node3"]
}

variable "ips" {
    description = "IPs of the VMs, respective to the hostname order"
    type        = list(string)
	default     = ["10.0.42.83", "10.0.42.84", "10.0.42.85"]
}

# defines ssh connection to check when the VM is ready for ansible provisioning
connection {
    host = var.ips[count.index]
    user = var.user
    private_key = file(var.ssh_keys["priv"])
    agent = false
    timeout = "3m"
}

provisioner "remote-exec" {
    inline = [ "echo 'Cool, we are ready for provisioning'"]
}

provisioner "local-exec" {
    working_dir = "../../ansible/"
    command = "ansible-playbook -u ${var.user} --key-file ${var.ssh_keys["priv"]} -i ${var.ips[count.index]}, provision.yaml"
}