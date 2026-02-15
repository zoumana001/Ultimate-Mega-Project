# Existing outputs
output "cluster_id" {
  value = aws_eks_cluster.devopsshack.id
}

output "node_group_id" {
  value = aws_eks_node_group.devopsshack.id
}

output "vpc_id" {
  value = aws_vpc.devopsshack_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.devopsshack_subnet[*].id
}

# EBS CSI Driver outputs
output "ebs_csi_driver_addon_name" {
  description = "EBS CSI driver addon name"
  value       = aws_eks_addon.ebs_csi_driver.addon_name
}

output "ebs_csi_driver_addon_version" {
  description = "EBS CSI driver addon version"
  value       = aws_eks_addon.ebs_csi_driver.addon_version
}

output "ebs_csi_driver_role_arn" {
  description = "EBS CSI driver IAM role ARN"
  value       = aws_iam_role.ebs_csi_driver_role.arn
}

output "ebs_csi_driver_role_name" {
  description = "EBS CSI driver IAM role name"
  value       = aws_iam_role.ebs_csi_driver_role.name
}

output "ebs_csi_driver_service_account_name" {
  description = "EBS CSI driver service account name"
  value       = "ebs-csi-controller-sa"
}

output "ebs_csi_driver_namespace" {
  description = "EBS CSI driver namespace"
  value       = "kube-system"
}

output "cluster_oidc_issuer" {
  description = "EKS cluster OIDC issuer"
  value       = aws_eks_cluster.devopsshack.identity[0].oidc[0].issuer
}

output "aws_account_id" {
  description = "AWS Account ID"
  value       = data.aws_caller_identity.current.account_id  # This references the one in main.tf
}

output "aws_region" {
  description = "AWS Region"
  value       = data.aws_region.current.name
}

# Combined output for easy reference
output "ebs_csi_driver_info" {
  description = "Combined EBS CSI driver information"
  value = {
    addon_name       = aws_eks_addon.ebs_csi_driver.addon_name
    addon_version    = aws_eks_addon.ebs_csi_driver.addon_version
    role_arn         = aws_iam_role.ebs_csi_driver_role.arn
    role_name        = aws_iam_role.ebs_csi_driver_role.name
    service_account  = "ebs-csi-controller-sa"
    namespace        = "kube-system"
    oidc_issuer      = aws_eks_cluster.devopsshack.identity[0].oidc[0].issuer
    account_id       = data.aws_caller_identity.current.account_id
  }
}

# Data source for region (if not already in main.tf)
data "aws_region" "current" {}
