terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
  shared_config_files      = ["C:\\Users\\Abdelrahman Gaber\\.aws\\config"]
  shared_credentials_files = ["C:\\Users\\Abdelrahman Gaber\\.aws\\credentials"]
  profile = "vscode"
}