resource "aws_ecs_cluster" "webapp" {
  name = var.name
}

resource "aws_ecs_task_definition" "webapp" {
  family                   = var.name
  requires_compatibilities = ["FARGATE"]

  cpu    = "256"
  memory = "512"

  network_mode = "awsvpc"

  container_definitions = jsonencode([
    {
      "name" : "example",
      "image" : var.webapp_image,
      "essential" : true,
      "portMappings" : [
        {
          "protocol" : "tcp",
          "containerPort" : 80
        }
      ]
    }
  ])
}
