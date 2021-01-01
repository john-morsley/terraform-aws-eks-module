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

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

########################################################################################################################
# CLUSTER
########################################################################################################################

variable "cluster_name" {
  type = string
}

//variable "node_settings" {
//  type = list(
//  object({
//    role          = list(string)
//    instance_type = string
//  })
//  )
//}
//
//variable "bucket_prefix" {
//  description = "An optional prefix for the bucket."
//  type        = string
//}

########################################################################################################################
# RANCHER
########################################################################################################################

variable "sub_domain" {
  type = string
}

variable "domain" {
  type = string
}





variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
}