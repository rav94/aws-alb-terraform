# Ingnition config include the previous defined systemd unit data resource
data "ignition_config" "nginx" {
  systemd = [
    "${data.ignition_systemd_unit.nginx.id}",
  ]
}
