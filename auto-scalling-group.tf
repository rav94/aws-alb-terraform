resource "aws_autoscaling_group" "nginx" {
  lifecycle { create_before_destroy = true }

  name                      = "nginx_${var.VERSION}-${aws_launch_configuration.nginx.name}"
  depends_on                = ["aws_launch_configuration.nginx"]
  launch_configuration      = "${aws_launch_configuration.nginx}"
  vpc_zone_identifier       = ["${aws_default_subnet.default-az1.id}", "${aws_default_subnet.default-az2.id}", "${aws_default_subnet.default-az3.id}"]
  health_check_grace_period = 300
  health_check_type         = "ELB"
  max_size                  = "${var.MAXIMUM_INSTANCE_SIZE}"
  min_size                  = "${var.MINIMUM_INSTANCE_SIZE}"
  desired_capacity          = "${var.DESIRED_INSTANCE_SIZE}"
  wait_for_elb_capacity     = "${var.MINIMUM_INSTANCE_SIZE}"
  termination_policies      = ["OldestInstance"]
  target_group_arns         = ["${aws_lb_target_group.nginx.arn}", "${aws_lb_target_group.nginx.arn}"]
}
