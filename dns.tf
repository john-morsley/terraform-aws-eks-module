# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone

data "aws_route53_zone" "this" {
  name = var.domain_name
}

output "zone" {
  value = data.aws_route53_zone.this
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record

resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.this.id

  name = "${var.sub_domain_name}.${data.aws_route53_zone.this.name}"
  type = "A"

  allow_overwrite = true

  alias {
    name                   = aws_lb.this.dns_name
    zone_id                = aws_lb.this.zone_id
    evaluate_target_health = true
  }
}

output "record" {
  value = aws_route53_record.this
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate

resource "aws_acm_certificate" "this" {
  domain_name       = aws_route53_record.this.name
  validation_method = "DNS"
  //provider = "aws.${var.region}"

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_route53_record.this
  ]
}

output "certificate" {
  value = aws_acm_certificate.this
}

resource "aws_route53_record" "certificate-validation" {
  zone_id = data.aws_route53_zone.this.id

  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  name    = each.value.name
  records = [each.value.record]
  type    = each.value.type
  ttl     = 60

  allow_overwrite = true
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.certificate-validation : record.fqdn]
}

output "validation" {
  value = aws_acm_certificate_validation.this
}
