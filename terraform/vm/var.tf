variable "proxmox_host" {
  type = map(any)
  default = {
    pm_api_url  = "https://10.0.1.12:8006/api2/json"
    pm_user     = "root@pam"
    target_node = "pve"
  }
}

variable "vmid" {
  default     = 300
  description = "Starting ID for the VMs"
}


variable "hostnames" {
  description = "Containers to be created"
  type        = list(string)
  default     = ["k-node1, k-node2, k-node3"]
}


variable "rootfs_size" {
  description = "Root filesystem size in GB"
  default     = "15G"
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
  type = map(any)
  default = {
    pub  = "~/.ssh/id_ed25519.pub"
    priv = "~/.ssh/id_ed25519"
  }
}

