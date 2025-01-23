remote_state {
  backend = "gcs"
  config = {
    bucket          = "bcatouillard-tfstate"
  }
}

terraform {
  source = "../shared"
}

inputs = {
  project       = "vg-server-439617"
  instance_type = "f1-micro"
  region        = "europe-west4"
}
