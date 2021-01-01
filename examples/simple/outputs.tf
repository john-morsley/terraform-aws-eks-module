
output "export_kubeconfig_command" {
  value = module.eks.export_kubeconfig_command
}

output "kubectl_get_nodes_kubeconfig_command" {
  value = module.eks.kubectl_get_nodes_kubeconfig_command
}

output "kubectl_get_all_pods_kubeconfig_command" {
  value = module.eks.kubectl_get_all_pods_kubeconfig_command
}

//output "kubeconfig_yaml" {
//  value = module.eks.kubeconfig_yaml
//}