terraform {
  backend "s3" {
    bucket         = "my-assignment-terraform-state"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
