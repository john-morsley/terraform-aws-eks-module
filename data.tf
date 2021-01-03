/*																					  
 _____        _        
|  __ \      | |       
| |  | | __ _| |_ __ _ 
| |  | |/ _` | __/ _` |
| |__| | (_| | || (_| |
|_____/ \__,_|\__\__,_|
                       
                     */

data "aws_eks_cluster" "cluster" {
  name = module.cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.cluster.cluster_id
}