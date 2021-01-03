/*
 _                     _     
| |                   | |    
| |     ___   ___ __ _| |___ 
| |    / _ \ / __/ _` | / __|
| |___| (_) | (_| (_| | \__ \
|______\___/ \___\__,_|_|___/

                           */

locals {

  //all_cidr_block = "0.0.0.0/0" # All possible IP address range

  bucket_prefix = length(var.bucket_prefix) == 0 ? "" : "${var.bucket_prefix}-"

  bucket_name = "${local.bucket_prefix}${var.cluster_name}-${random_pet.this.id}"

  //cluster_id_tag = {
  //  "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  //}

  //node_name = "${var.ec2_name}-1"

}