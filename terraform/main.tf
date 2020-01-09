provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "./modules/vpc"

  name = local.name

  tags = local.tags
}

module "ecs" {
  source = "./modules/ecs"

  name         = local.name
  webapp_image = "nginx:latest"
}
