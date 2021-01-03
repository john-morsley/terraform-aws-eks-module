/*
  ____        _               _       
 / __ \      | |             | |      
| |  | |_   _| |_ _ __  _   _| |_ ___ 
| |  | | | | | __| '_ \| | | | __/ __|
| |__| | |_| | |_| |_) | |_| | |_\__ \
 \____/ \__,_|\__| .__/ \__,_|\__|___/
                 | |                  
                 |_|                */

output "export_kubeconfig_command" {
  value = "export KUBECONFIG=k8s/kubeconfig.yaml"
}

output "kubectl_get_nodes_kubeconfig_command" {
  value = "kubectl get no --output=wide --kubeconfig=k8s/kubeconfig.yaml"
}

output "kubectl_get_all_pods_kubeconfig_command" {
  value = "kubectl get po --all-namespaces --output=wide --kubeconfig=k8s/kubeconfig.yaml"
}

output "kubeconfig_yaml" {
  value = module.cluster.kubeconfig
}

//output "ingress_nginx" {
//  value = helm_release.ingress-nginx
//}

output "load_balancer_url" {
  value = data.kubernetes_service.ingress-nginx.load_balancer_ingress[0].hostname
}

data "aws_elb_hosted_zone_id" "main" {}

output "load_balancer_zone_id" {
  value = data.aws_elb_hosted_zone_id.main.id
}

output "cluster_id" {
  value = module.cluster.cluster_id
}