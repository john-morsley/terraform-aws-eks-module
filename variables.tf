########################################################################################################################
# VPC
########################################################################################################################

variable "vpc_id" {
  type = string
}

variable "cidr_range" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

########################################################################################################################
# CLUSTER
########################################################################################################################

variable "cluster_name" {
  type = string
}

variable "node_group_settings" {
  type = list(
  object({
    name = string
    minimum_size  = number
    desired_size  = number
    maximum_size  = number
    type = string
    instance_type = string
  })
  )
  default = []
}

variable "node_group_spot_settings" {
  type = list(
  object({
    name = string
    minimum_size  = number
    desired_size  = number
    maximum_size  = number
    instance_types = list(string)
  })
  )
  default = []
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = []
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

variable "bucket_name" {
  type = string
}

########################################################################################################################
# DOMAIN
########################################################################################################################

variable "sub_domain_name" {
  type = string
}

variable "domain_name" {
  type = string
}

########################################################################################################################
# NGINX INGRESS
########################################################################################################################

variable "ingress_nginx_helm_repository" {
  type        = string
  default     = "https://kubernetes.github.io/ingress-nginx"
  description = "Helm chart to use for the NGINX Ingress install"
}

variable "ingress_nginx_helm_chart" {
  type        = string
  default     = "ingress-nginx"
  description = "Helm chart to use for the NGINX Ingress install"
}

//variable "ingress_nginx_helm_version" {
//  type        = string
//  description = "Version of the NGINX Ingress to install."
//}