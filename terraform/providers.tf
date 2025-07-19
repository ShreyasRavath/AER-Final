
provider "aws" {
  alias  = "primary"
  region = var.primary_region
}

provider "aws" {
  alias  = "standby"
  region = var.standby_region
}
# Data for primary EKS cluster
data "aws_eks_cluster" "primary" {
  name     = var.primary_cluster_name
  provider = aws.primary
}

data "aws_eks_cluster_auth" "primary" {
  name     = var.primary_cluster_name
  provider = aws.primary
}

# Data for standby EKS cluster
data "aws_eks_cluster" "standby" {
  name     = var.standby_cluster_name
  provider = aws.standby
}

data "aws_eks_cluster_auth" "standby" {
  name     = var.standby_cluster_name
  provider = aws.standby
}

# Kubernetes provider for primary region
provider "kubernetes" {
  alias                  = "primary"
  host                   = data.aws_eks_cluster.primary.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.primary.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.primary.token
  load_config_file       = false
}

# Kubernetes provider for standby region
provider "kubernetes" {
  alias                  = "standby"
  host                   = data.aws_eks_cluster.standby.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.standby.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.standby.token
  load_config_file       = false
}
