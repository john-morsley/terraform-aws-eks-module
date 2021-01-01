variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "domain_name" {
  type = string
}

variable "sub_domain_name" {
  type = string
}


variable "cidr_range" {
  type = string
}





//variable "region" {
//  default = "eu-west-2" # London
//}
//
//
//variable "public_subnet_one" {
//  default = "172.31.0.2/24"
//}
//
//variable "public_subnet_two" {
//  default = "172.31.0.4/24"
//}
//
//variable "public_subnet_three" {
//  default = "172.31.0.6/24"
//}
//
//variable "private_subnet_one" {
//  default = "172.31.0.1/24"
//}
//
//variable "private_subnet_two" {
//  default = "172.31.0.3/24"
//}
//
//variable "private_subnet_three" {
//  default = "172.31.0.5/24"
//}
//
//
variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = []
  //  default = [
  //    "777777777777",
  //    "888888888888",
  //  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = []
}