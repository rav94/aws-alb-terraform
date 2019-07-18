# Systemd unit data resource containing the unit definition
data "ignition_systemd_unit" "nginx" {
  name = "nginx.service"
  content = "[Unit]\r\nDescription=Nginx Service\r\nAfter=docker.service\r\nRequires=docker.service\r\n\r\n[Service]\r\nTimeoutStartSec=0\r\nRestart=on-failure\r\nExecStartPre=-/usr/bin/docker kill nginx\r\nExecStartPre=-/usr/bin/docker rm -f nginx\r\nExecStartPre=-/usr/bin/docker pull nginx\r\nExecStartPre=-/bin/sh -c \"/bin/docker rmi $(docker images --quiet --filter 'dangling=true')\"\r\nExecStart=/usr/bin/docker run --publish=80:80 --name nginx nginx\r\nExecStop=/usr/bin/docker stop nginx\r\n\r\n[Install]\r\nWantedBy=multi-user.target"
}
