resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks.arn
  vpc_config { subnet_ids = var.subnet_ids }
}

resource "aws_iam_role" "eks" {
  name = "eks-cluster-role-${var.cluster_name}"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": { "Service": "eks.amazonaws.com" },
    "Action": "sts:AssumeRole"
  }]
}
POLICY
}