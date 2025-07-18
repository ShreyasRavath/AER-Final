
module "primary_eks" {
  source = "./modules/eks_cluster"
  cluster_name = "primary-eks"
  region       = var.primary_region
  subnet_ids   = var.primary_subnet_ids
  vpc_id       = var.primary_vpc_id
}

module "standby_eks" {
  source = "./modules/eks_cluster"
  cluster_name = "standby-eks"
  region       = var.standby_region
  subnet_ids   = var.standby_subnet_ids
  vpc_id       = var.standby_vpc_id
}

module "primary_efs" {
  source = "./modules/efs_storage"
  region           = var.primary_region
  file_system_name = "primary-efs"
  subnet_ids       = var.primary_subnet_ids
  security_group_id = var.primary_sg
}

module "standby_efs" {
  source = "./modules/efs_storage"
  region           = var.standby_region
  file_system_name = "standby-efs"
  subnet_ids       = var.standby_subnet_ids
  security_group_id = var.standby_sg
}
