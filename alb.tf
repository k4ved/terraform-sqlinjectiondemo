resource "aws_lb" "injection_demo" {
  name               = "sql-injection-demo"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.injection_demo.id]
  subnets            = [aws_default_subnet.us_west_2b.id, aws_default_subnet.us_west_2c.id, aws_default_subnet.us_west_2a.id, aws_default_subnet.us_west_2d.id]

}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.injection_demo.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.injection_demo.arn
  }
}
