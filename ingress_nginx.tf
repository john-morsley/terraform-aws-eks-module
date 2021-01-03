/*

The whole point of this project was to verify that Rancher could be installed on an AWS EKS cluster.
Looking at the following documentation, it was apparent that I was missing an Ingress controller.

*/

# https://rancher.com/docs/rancher/v2.x/en/installation/install-rancher-on-k8s/

/*

Set up the Rancher server’s local Kubernetes cluster.

The cluster requirements depend on the Rancher version:

As of Rancher v2.5, Rancher can be installed on any Kubernetes cluster. This cluster can use upstream Kubernetes, or it 
can use one of Rancher’s Kubernetes distributions, or it can be a managed Kubernetes cluster from a provider such as 
Amazon EKS. > Note: To deploy Rancher v2.5 on a hosted Kubernetes cluster such as EKS, GKE, or AKS, you should deploy a 
compatible Ingress controller first to configure SSL termination on Rancher..

*/

# https://aws.amazon.com/premiumsupport/knowledge-center/eks-access-kubernetes-services/


resource "kubernetes_namespace" "ingress-nginx" {

  metadata {
    //    annotations = {
    //      name = "example-annotation"
    //    }
    //
    //    labels = {
    //      mylabel = "label-value"
    //    }

    name = "ingress-nginx"
  }

}

resource "helm_release" "ingress-nginx" {

  name       = "${var.cluster_name}-ingress"
  repository = var.ingress_nginx_helm_repository
  chart      = var.ingress_nginx_helm_chart
  //version    = "v${var.ingress-nginx_helm_version}"
  namespace = "ingress-nginx"

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  # Bogus set to link together resources for proper tear down?
  set {
    name  = "tf_link"
    value = module.cluster.cluster_id
  }

  depends_on = [
    module.cluster,
    kubernetes_namespace.ingress-nginx
  ]

}

//output "ingress-nginx" {
//  value = helm_release.ingress-nginx
//}

data "kubernetes_service" "ingress-nginx" {
  metadata {
    name      = "${var.cluster_name}-ingress-ingress-nginx-controller"
    namespace = "ingress-nginx"
  }
  depends_on = [helm_release.ingress-nginx]
}

output "ingress_nginx" {
  value      = data.kubernetes_service.ingress-nginx
  depends_on = [helm_release.ingress-nginx]
}