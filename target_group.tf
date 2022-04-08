resource "aws_lb_target_group" "injection_demo" {
  name     = "demogroup"
  port     = 80
  protocol = "HTTP"
  vpc_id = aws_default_vpc.default.id
  health_check {
    path = "/login.php"
  }
}

resource "aws_lb_target_group_attachment" "injection_demo" {
  target_group_arn = aws_lb_target_group.injection_demo.arn
  target_id        = aws_instance.injection_demo.id
  port             = 80
}
