/*
  _____                      _ _            _____                         _____       _           
 / ____|                    (_) |          / ____|                       |  __ \     | |          
| (___   ___  ___ _   _ _ __ _| |_ _   _  | |  __ _ __ ___  _   _ _ __   | |__) |   _| | ___  ___ 
 \___ \ / _ \/ __| | | | '__| | __| | | | | | |_ | '__/ _ \| | | | '_ \  |  _  / | | | |/ _ \/ __|
 ____) |  __/ (__| |_| | |  | | |_| |_| | | |__| | | | (_) | |_| | |_) | | | \ \ |_| | |  __/\__ \
|_____/ \___|\___|\__,_|_|  |_|\__|\__, |  \_____|_|  \___/ \__,_| .__/  |_|  \_\__,_|_|\___||___/
                                    __/ |                        | |                              
                                   |___/                         |_|                            */

//resource "aws_security_group_rule" "ingress" {
//
//  security_group_id = aws_security_group.all_worker_traffic.id
//
//  type        = "ingress"
//  from_port   = 0
//  to_port     = 65535
//  protocol    = -1
//  cidr_blocks = [var.cidr_range]
//
//}
//
//resource "aws_security_group_rule" "egress" {
//
//  security_group_id = aws_security_group.all_worker_traffic.id
//
//  type        = "egress"
//  from_port   = 0
//  to_port     = 65535
//  protocol    = -1
//  cidr_blocks = ["0.0.0.0/0"]
//
//}