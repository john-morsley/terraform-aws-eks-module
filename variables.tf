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

variable "bucket_name" {
  type = string
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