/*
__      __        _       _     _           
\ \    / /       (_)     | |   | |          
 \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
  \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
   \  / (_| | |  | | (_| | |_) | |  __/\__ \
    \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

                                          */

########################################################################################################################
# VPC
########################################################################################################################

vpc_cidr             = "10.0.0.0/16"
private_subnet_cidrs = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
public_subnet_cidrs  = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]

########################################################################################################################
# CLUSTER
########################################################################################################################

cluster_name = "eks"
node_group_settings = [
  {
    name          = "on-demand-1"
    minimum_size  = 1
    desired_size  = 2
    maximum_size  = 3
    type          = "on-demand"
    instance_type = "t2.xlarge"
  },
  {
    name          = "spot-1"
    minimum_size  = 3
    desired_size  = 5
    maximum_size  = 7
    type          = "spot"
    instance_type = "t3.xlarge"
  }
]
node_group_spot_settings = [
  {
    name           = "spot-2"
    minimum_size   = 1
    desired_size   = 2
    maximum_size   = 3
    instance_types = ["m5.xlarge", "m5d.xlarge", "m5n.xlarge", "m5dn.xlarge", "m5a.xlarge", "m5ad.xlarge"]
  }
]
bucket_prefix = "morsley-io"

########################################################################################################################
# DOMAIN
########################################################################################################################

sub_domain = "eks"
domain     = "morsley.io"




map_accounts = [
  "845528683987",
]

map_roles = [
]

map_users = [
  {
    userarn  = "arn:aws:iam::845528683987:user/terraform"
    username = "terraform"
    groups   = ["system:masters"]
  },
  {
    userarn  = "arn:aws:iam::845528683987:user/administrator"
    username = "administrator"
    groups   = ["system:masters"]
  },
]