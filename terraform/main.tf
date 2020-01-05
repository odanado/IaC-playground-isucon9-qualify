provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "./modules/vpc"

  name = "isucon9-qualify"
  tags = local.tags
}
