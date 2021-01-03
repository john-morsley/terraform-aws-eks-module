# Terraform a Kubernetes Cluster (EKS) on AWS via the terraform-aws-modules/terraform-aws-eks Module

This module create a Kubernetes cluster (EKS) on AWS using the AWS EKS module.
For details of how to use, refer to the examples folder.

When the Terraform code has executed, a kubeconfig file will be output in the root folder.

This file does require the aws-iam-authenticator to be installed on your machine.

See: https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html