provider "google" {
    credentials = file("./KEY.json")
    project = "master-coder-280116"
    region = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "manager-instance"
  machine_type = "f1-micro"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}
resource "google_compute_instance" "vm_nodes_1" {
  name         = "node-instance-1"
  machine_type = "f1-micro"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }