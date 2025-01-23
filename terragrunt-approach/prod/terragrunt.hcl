remote_state {
  backend = "gcs"
  config = {
    bucket          = "bcatouillard-gke-tfstate"
  }
}

terraform {
  source = "../shared"
}

inputs = {
  project       = "kubernetes-terraform-369708"
  instance_type = "n2-standard-4"
  region        = "europe-west1"
}
