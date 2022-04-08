output "load_balancer_url" {
  value = aws_lb.injection_demo.dns_name
}
