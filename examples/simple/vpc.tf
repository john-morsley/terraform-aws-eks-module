/*
__      __  _____     _____ 
\ \    / / |  __ \   / ____|
 \ \  / /  | |__) | | |     
  \ \/ /   |  ___/  | |     
   \  /    | |      | |____ 
    \/     |_|       \_____|

                          */

//module "vpc" {
//
//  source = "./../../../terraform-aws-vpc-module"
//  #source = "john-morsley/vpc/aws"
//
//  name = "rancher"
//
//  vpc_cidr            = var.vpc_cidr
//  public_subnet_cidrs = var.public_subnet_cidrs
//
//  //public_subnet_tags = local.cluster_id_tag
//
//  availability_zones = data.aws_availability_zones.available.names
//
//}















module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  //version = "2.47.0"
  version = "2.64.0"

  name                 = "eks-vpc"
  cidr                 = "172.31.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["172.31.1.0/24", "172.31.3.0/24", "172.31.5.0/24"] // Odd
  public_subnets       = ["172.31.2.0/24", "172.31.4.0/24", "172.31.6.0/24"] // Even
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support = true

    public_subnet_tags = {
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
      "kubernetes.io/role/elb"                      = "1"
    }

    private_subnet_tags = {
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
      "kubernetes.io/role/internal-elb"             = "1"
    }
}


