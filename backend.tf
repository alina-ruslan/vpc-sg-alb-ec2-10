terraform {
  backend "s3" {
    bucket  = "okayweek7tfstate"
    key     = "alb/terraform.tfstate" #
    region  = "us-east-1"
    encrypt = true
    #use_lockfile  = true
  }
}
