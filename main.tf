resource "aws_security_group" "allow_tls" {
  name        = local.name
  description = "Security group for ${var.project_name} in ${var.environment} environment"
    vpc_id      = var.vpc_id

    dynamic "egress" {
        for_each = var.outband_rules
        content {
            protocol    = egress.value.protocol
            from_port   = egress.value.from_port
            to_port     = egress.value.to_port
            cidr_blocks = egress.value.cidr_blocks
        } 
    }
    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            protocol    = ingress.value.protocol
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
    # Tags for the security group
    tags        = merge(
        var.comman_tags, 
        var.sg_tags,
        { Name = local.name })
}