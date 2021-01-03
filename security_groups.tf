/*
  _____                      _ _            _____                                  
 / ____|                    (_) |          / ____|                                
| (___   ___  ___ _   _ _ __ _| |_ _   _  | |  __ _ __ ___  _   _ _ __   
 \___ \ / _ \/ __| | | | '__| | __| | | | | | |_ | '__/ _ \| | | | '_ \ 
 ____) |  __/ (__| |_| | |  | | |_| |_| | | |__| | | | (_) | |_| | |_) |
|_____/ \___|\___|\__,_|_|  |_|\__|\__, |  \_____|_|  \___/ \__,_| .__/ 
                                    __/ |                        | |                              
                                   |___/                         |_|  
                                                                      */

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "worker_group_management_small" {
  name_prefix = "worker_group_management_small"
  vpc_id      = var.vpc_id

  //  ingress {
  //    from_port = 22
  //    to_port   = 22
  //    protocol  = "tcp"
  //
  //    cidr_blocks = [
  //      "10.0.0.0/8",
  //    ]
  //  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "all_worker_management" {
  name_prefix = "all_worker_management"
  vpc_id      = var.vpc_id

  //  ingress {
  //    from_port = 22
  //    to_port   = 22
  //    protocol  = "tcp"
  //
  //    cidr_blocks = [
  //      "10.0.0.0/8",
  //      "172.16.0.0/12",
  //      "192.168.0.0/16",
  //    ]
  //  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "all_worker_traffic" {
  vpc_id = var.vpc_id
}
