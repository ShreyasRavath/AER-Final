
module "primary_vpc" {
  source       = "./modules/vpc"
  name         = "primary"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  azs          = ["us-east-1a", "us-east-1b"]
}

module "standby_vpc" {
  providers    = { aws = aws.standby }
  source       = "./modules/vpc"
  name         = "standby"
  vpc_cidr     = "10.1.0.0/16"
  subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]
  azs          = ["us-east-2a", "us-east-2b"]
}

module "primary_eks" {
  source       = "./modules/eks_cluster"
  cluster_name = "primary-eks"
  region       = var.primary_region
  subnet_ids   = module.primary_vpc.subnet_ids
  vpc_id       = module.primary_vpc.vpc_id
}

module "standby_eks" {
  source       = "./modules/eks_cluster"
  providers = { aws = aws.standby}
  cluster_name = "standby-eks"
  region       = var.standby_region
  subnet_ids   = module.standby_vpc.subnet_ids
  vpc_id       = module.standby_vpc.vpc_id

  depends_on = [
    module.standby_vpc
  ]
}

module "primary_efs" {
  source            = "./modules/efs_storage"
  region            = var.primary_region
  file_system_name  = "primary-efs"
  subnet_ids        = module.primary_vpc.subnet_ids
  security_group_id = module.primary_vpc.security_group_id
}

module "standby_efs" {
  source            = "./modules/efs_storage"
  providers = { aws = aws.standby}
  region            = var.standby_region
  file_system_name  = "standby-efs"
  subnet_ids        = module.standby_vpc.subnet_ids
  security_group_id = module.standby_vpc.security_group_id

  depends_on = [
    module.standby_vpc
  ]
}

module "ecr" {
  source = "./modules/ecr"
  account_id = var.account_id
}
