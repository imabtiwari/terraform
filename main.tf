provider "google" {
    credentials = file("./KEY.json")
    project = "master-coder-280116"
    region = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

resource "google_storage_bucket" "demo" {
  name          = "bucket-terraform-123"
  location      = "US"
  force_destroy = true

  bucket_policy_only = true
}