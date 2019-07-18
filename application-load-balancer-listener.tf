resource "aws_lb_listener" "nginx" {
  load_balancer_arn = "${aws_lb.nginx.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.nginx.arn}"
    type             = "forward"
  }
}
