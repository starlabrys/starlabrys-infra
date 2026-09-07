terraform {
  required_version = ">= 1.6"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "wiloon-tofu-state"
    key    = "infra/github/runlog/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "github" {
  owner = var.github_owner
  token = var.github_token
}
