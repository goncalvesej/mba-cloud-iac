terraform {
  backend "s3" {
    bucket = "terraform-bucket-mack-us-east-1-goncalves"
    key    = "tfstatefiles/tfstate.tf"
    region = "us-east-1"
  }
}
