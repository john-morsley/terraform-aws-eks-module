/*
 ______   _  __   _____ 
|  ____| | |/ /  / ____|
| |__    | ' /  | (___  
|  __|   |  <    \___ \ 
| |____  | . \   ____) |
|______| |_|\_\ |_____/ 
                         
                      */

module "eks" {

  source = "./../../../terraform-aws-eks-module"
  #source = "john-morsley/vpc/aws"

  cluster_name = var.cluster_name

  vpc_id         = module.vpc.vpc_id // module.vpc.id
  public_subnet_ids = module.vpc.public_subnets // module.vpc.public_subnet_ids

  sub_domain_name = var.cluster_name
  domain_name     = var.domain

  map_roles    = var.map_roles
  map_users    = var.map_users
  map_accounts = var.map_accounts

  cidr_range = "10.0.0.0/8" // var.vpc_cidr

  //depends_on = [module.vpc]

}