/*
  ____        _               _       
 / __ \      | |             | |      
| |  | |_   _| |_ _ __  _   _| |_ ___ 
| |  | | | | | __| '_ \| | | | __/ __|
| |__| | |_| | |_| |_) | |_| | |_\__ \
 \____/ \__,_|\__| .__/ \__,_|\__|___/
                 | |                  
                 |_|                */

//output "node_settings" {
//  value = var.node_group_settings
//}
//
//output "node_group_spot_settings" {
//  value = var.node_group_spot_settings
//}



output "export_kubeconfig_command" {
  value = module.cluster.export_kubeconfig_command
}

output "kubectl_get_nodes_kubeconfig_command" {
  value = module.cluster.kubectl_get_nodes_kubeconfig_command
}

output "kubectl_get_all_pods_kubeconfig_command" {
  value = module.cluster.kubectl_get_all_pods_kubeconfig_command
}

output "load_balancer_url" {
  value = module.cluster.load_balancer_url
}

output "load_balancer_zone_id" {
  value = module.cluster.load_balancer_zone_id
}

output "node_group_settings" {
  value = module.cluster.node_group_settings
}

output "node_group_spot_settings" {
  value = module.cluster.node_group_spot_settings
}

output "worker_groups" {
  value = module.cluster.worker_groups
}

output "worker_groups_launch_template" {
  value = module.cluster.worker_groups_launch_template
}