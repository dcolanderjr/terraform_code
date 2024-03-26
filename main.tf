provider "aws" {
    region = "ca-central-1"
}

module "prod" {
    source = "./modules/prod"
}

module "dev" {
    source = "./modules/dev"
}

module "test" {
    source = "./modules/test"
}

module "sg" {
    source = "./modules/sg"
}