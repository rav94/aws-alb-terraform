resource "aws_lb" "nginx" {
  name               = "nginx"
  subnets            = ["${aws_default_subnet.default-az1.id}", "${aws_default_subnet.default-az2.id}", "${aws_default_subnet.default-az3.id}"]
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.nginx.id}"]

  tags = {
    Name        = "nginx"
    Environment = "Dev"
  }

  lifecycle {
    prevent_destroy = false
  }
}
