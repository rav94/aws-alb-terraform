resource "aws_lb_target_group" "nginx" {
  name        = "nginx"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_default_vpc.default.id}"
  target_type = "instance"

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200,202"
  }
}


