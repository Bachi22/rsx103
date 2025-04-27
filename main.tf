terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url   = "https://...../api2/json"
  pm_api_token_id      = "terraform@..."
  pm_api_token_secret  = "....."
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "opnsense" {
  name		= "opnsense-25"
  target_node	= "mypve"

  cores		= 2
  memory	= 4096
  sockets	= 1

  disk {
    size	= "32G"
    type	= "scsi"
    storage	= "local-lvm"
    format	= "raw"
  }

  iso = "local:iso/OPNsense-25.1-dvd-amd64.iso"

  network {
    model	= "virtio"
    bridge	= "vmbr0"
  }

  boot		= "cd"
  bootdisk	= "scsi0"
  onboot	= "false"
}


resource "proxmox_vm_qemu" "debian_vm" {
  name        = "debian-ansible"
  target_node = "mypve"
  clone       = "debian-cloudinit"

  cores       = 2
  memory      = 2048
  agent       = 1
  onboot      = true

  disk {
    size         = "20G"
    type         = "scsi"
    storage      = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=dhcp"

  cicustom = {
    "user-data" = file("cloud-init/user-data.yml")
  }

}
