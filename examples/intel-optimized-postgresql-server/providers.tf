provider "aws" {
  # Environment Variables used for Authentication
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key

}
