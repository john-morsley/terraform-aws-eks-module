locals {

  worker_groups = [
    for index, setting in var.node_group_settings :
//    merge(setting, {
//      "public_ip"           = local.node_outputs[index].public_ip
//      "private_ip"          = local.node_outputs[index].private_ip
//      "encoded_private_key" = local.node_outputs[index].encoded_private_key
//    })
    {
      name                 = "${setting.name}-"
      instance_type        = setting.instance_type
      asg_min_size         = setting.minimum_size
      asg_desired_capacity = setting.desired_size
      asg_max_size         = setting.maximum_size
      kubelet_extra_args   = setting.type == "on-demand" ? "--node-labels=node.kubernetes.io/lifecycle=normal" : "--node-labels=node.kubernetes.io/lifecycle=spot"
      suspended_processes  = ["AZRebalance"]
    }     
  ]

  worker_groups_launch_template = [
    for index, setting in var.node_group_spot_settings :
  //    merge(setting, {
  //      "public_ip"           = local.node_outputs[index].public_ip
  //      "private_ip"          = local.node_outputs[index].private_ip
  //      "encoded_private_key" = local.node_outputs[index].encoded_private_key
  //    })
    {
      name                    = "${setting.name}-"
      override_instance_types = setting.instance_types
      asg_min_size            = setting.minimum_size
      asg_desired_capacity    = setting.desired_size
      asg_max_size            = setting.maximum_size
      kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot"
      //spot_instance_pools     = length(setting.instance_types)
    }
  ]

}

/*

ON-DEMAND/SPOT:

worker_groups = [
    {
      name                = "on-demand-1"
      instance_type       = "m4.xlarge"
      asg_max_size        = 1
      kubelet_extra_args  = "--node-labels=node.kubernetes.io/lifecycle=normal"
      suspended_processes = ["AZRebalance"]
    },
    {
      name                = "spot-1"
      spot_price          = "0.199"
      instance_type       = "c4.xlarge"
      asg_max_size        = 20
      kubelet_extra_args  = "--node-labels=node.kubernetes.io/lifecycle=spot"
      suspended_processes = ["AZRebalance"]
    },
    {
      name                = "spot-2"
      spot_price          = "0.20"
      instance_type       = "m4.xlarge"
      asg_max_size        = 20
      kubelet_extra_args  = "--node-labels=node.kubernetes.io/lifecycle=spot"
      suspended_processes = ["AZRebalance"]
    }
  ]

SPOT:

worker_groups_launch_template = [
  {
    name                    = "spot-1"
    override_instance_types = ["m5.large", "m5a.large", "m5d.large", "m5ad.large"]
    spot_instance_pools     = 4
    asg_max_size            = 5
    asg_desired_capacity    = 5
    kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot"
    public_ip               = true
  },
]

*/