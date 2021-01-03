//resource "random_string" "suffix" {
//  length  = 8
//  special = false
//}
//
//# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
//
//resource "aws_security_group" "worker_group_management_small" {
//  name_prefix = "worker_group_management_small"
//  vpc_id      = module.vpc.vpc_id
//
////  ingress {
////    from_port = 22
////    to_port   = 22
////    protocol  = "tcp"
////
////    cidr_blocks = [
////      "10.0.0.0/8",
////    ]
////  }
//}
//
//# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
//
//resource "aws_security_group" "all_worker_management" {
//  name_prefix = "all_worker_management"
//  vpc_id      = module.vpc.vpc_id
//  
////  ingress {
////    from_port = 22
////    to_port   = 22
////    protocol  = "tcp"
////
////    cidr_blocks = [
////      "10.0.0.0/8",
////      "172.16.0.0/12",
////      "192.168.0.0/16",
////    ]
////  }
//}
//
//# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
//
//resource "aws_security_group" "all_worker_traffic" {
//  vpc_id = module.vpc.vpc_id
//}
//
//resource "aws_security_group_rule" "ingress" {
//
//  security_group_id = aws_security_group.all_worker_traffic.id
//  
//  type        = "ingress"
//  from_port   = 0
//  to_port     = 65535
//  protocol    = -1
//  cidr_blocks = [var.cidr_range]
//
//}
//
//resource "aws_security_group_rule" "egress" {
//
//  security_group_id = aws_security_group.all_worker_traffic.id
//
//  type        = "egress"
//  from_port   = 0
//  to_port     = 65535
//  protocol    = -1
//  cidr_blocks = ["0.0.0.0/0"]
//
//}
//
//
//# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
//module "eks" {
//  //source          = "../.."
//  source  = "terraform-aws-modules/eks/aws"
//  version = "13.2.1"
//
//  cluster_name    = local.cluster_name
//  cluster_version = "1.18"
//  //subnets         = module.vpc.private_subnets
//  subnets         = module.vpc.public_subnets
//  
//  tags = {
//    Environment = "test"
//    GithubRepo  = "terraform-aws-eks"
//    GithubOrg   = "terraform-aws-modules"
//  }
//
//  vpc_id = module.vpc.vpc_id
//
//  # See the following for more details:
//  # https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/local.tf
//  worker_groups = [
//    {
//      name          = "worker-group-small"
//      instance_type = "t2.small"
//      //additional_userdata           = "echo foo bar"
//      asg_min_size =1 
//      asg_desired_capacity          = 2
//      asg_max_size = 3
//      additional_security_group_ids = [aws_security_group.worker_group_management_small.id]
//      target_group_arns = [
//        aws_lb_target_group.http.arn,
//        aws_lb_target_group.https.arn
//      ]
//      public_ip = true
//    }
//  ]
//
//  worker_additional_security_group_ids = [
//    aws_security_group.all_worker_management.id,
//    aws_security_group.all_worker_traffic.id
//  ]
//  map_roles                            = var.map_roles
//  map_users                            = var.map_users
//  map_accounts                         = var.map_accounts
//
//  write_kubeconfig   = true
//  config_output_path = "./../kube/kubeconfig.yaml"
//}