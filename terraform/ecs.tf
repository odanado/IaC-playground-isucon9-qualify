resource "aws_ecs_cluster" "webapp" {
  name = "isucon9-qualify"
}

resource "aws_ecs_task_definition" "webapp" {
  family                   = "isucon9-qualify"
  requires_compatibilities = ["FARGATE"]

  cpu    = "256"
  memory = "512"

  network_mode = "awsvpc"

  container_definitions = jsonencode([
    {
      "name" : "example",
      "image" : "nginx:latest",
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
/*
resource "aws_ecs_service" "this" {
  name = "webapp"

  cluster         = aws_ecs_cluster.webapp.name
  task_definition = aws_ecs_task_definition.webapp.arn

  launch_type   = "FARGATE"
  desired_count = 1
}
*/
