# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs

provider "kubernetes" {

  load_config_file = false

  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token

  //version                = "~> 1.11"

}

provider "helm" {

  kubernetes {

    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
    //client_certificate     = local.user_client_certificate
    //client_key             = local.user_client_key

  }

}