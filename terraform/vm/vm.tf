terraform {
  required_version = ">= 1.3.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.0.1.12:8006/api2/json"
}

resource "proxmox_vm_qemu" "proxmox_vm" {
  count       = 3
  name        = "kt-node${count.index}"
  target_node = var.proxmox_host["target_node"]
  iso         = "local-lvm:iso/debian-11.1.0-amd64-netinst.iso"
  bios        = "ovmf"
  cores       = 2
  sockets     = "1"
  cpu         = "host"
  memory      = 2048

  disk {
    type    = "virtio"
    storage = "local-lvm"
    size    = var.rootfs_size
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

}

