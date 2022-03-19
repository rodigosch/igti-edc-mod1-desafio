# Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-igti-rodrigo"
    key    = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}