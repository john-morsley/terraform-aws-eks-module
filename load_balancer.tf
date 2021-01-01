# The EKS module requires the ARNs of an application load balancer. So...

# https://www.terraform.io/docs/providers/aws/r/lb.html

resource "aws_lb" "this" {

  name                             = "eks-alb"
  internal                         = false
  load_balancer_type               = "application"
  subnets                          = var.public_subnet_ids
  enable_cross_zone_load_balancing = true

  enable_deletion_protection = false

  #  tags = {
  #    Environment = "production"
  #  }

}

resource "aws_lb_target_group" "http" {
  name     = "eks-workers-http-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_target_group" "https" {
  name     = "eks-workers-https-tg"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.this.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https.arn
  }

  depends_on = [
    aws_acm_certificate.this,
    aws_acm_certificate_validation.this
  ]
}