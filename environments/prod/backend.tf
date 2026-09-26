terraform {
  backend "s3" {
    bucket       = "sujay-terraform-state-2026"
    key          = "ecommerce/prod/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }
}
