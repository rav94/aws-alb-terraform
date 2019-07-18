resource "aws_launch_configuration" "nginx" {
  lifecycle { create_before_destroy = true }

  image_id             = "ami-028e043d0e518a84a"
  instance_type        = "t2.micro"
  key_name             = "rnf-sec"
  security_groups      = ["${aws_security_group.nginx.id}"]
  user_data            = "${data.ignition_config.nginx.rendered}"
}
