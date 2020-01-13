resource "aws_alb" "this" {
  name = var.name

  load_balancer_type = "application"

  tags = var.tags
}
