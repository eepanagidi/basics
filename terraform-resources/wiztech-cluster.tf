provider "aws" {
  region = "us-west-2" # Change this to your desired region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "wiztech-test"
  cluster_version = "1.26" # 
  subnets         = ["subnet-abcde012", "subnet-bcde012a"] # Replace these

  node_groups = {
    eks_nodes = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_type = "t2.small"
      key_name      = var.ssh_key_name
    }
  }
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}
