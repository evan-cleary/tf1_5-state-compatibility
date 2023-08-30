terraform {
  backend "local" {

  }
  required_version = ">=1.3,<1.5"
}

data "terraform_remote_state" "tf1_5_state_with_checks" {
  backend = "local"
  config = {
    path = "../tf1_5/terraform.tfstate"
  }
}
