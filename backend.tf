terraform {
  backend "s3" {
    bucket  = "okayweek7tfstate"# e.g., "my-terraform-state-bucket"
    key     = "alb/terraform.tfstate" #
    region  = "us-east-1"
    encrypt = true
    #use_lockfile  = true
  }
}
