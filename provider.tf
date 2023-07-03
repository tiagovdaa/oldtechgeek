provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "tiago-tfstates"
    key    = "oldtechgeek.tfstate"
    region = "us-west-2"
  }
}