variable "proxmox_host" {
	type = map
     default = {
       pm_api_url = "https://10.0.1.12:8006/api2/json"
       pm_user = "root@pam"
       target_node = "pve"
     }
}

variable "vmid" {
	default     = 400
	description = "Starting ID for the CTs"
}


variable "hostnames" {
  description = "Containers to be created"
  type        = list(string)
  default     = ["s-node1, s-node2, s-node3"]
}


variable "rootfs_size" {
	description = "Root filesystem size in GB"
	default = "2G"
}

variable "ips" {
    description = "IPs of the containers, respective to the hostname order"
    type        = list(string)
	default     = ["10.0.42.83"]
}

variable "user" {
	default     = "root"
	description = "Ansible user used to provision the container"
}

variable "ssh_keys" {
	type = map
     default = {
       pub = "~/.ssh/id_ed25519-pwless.pub"
       priv = "~/.ssh/id_ed25519-pwless"
     }
}