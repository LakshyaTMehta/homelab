{ pkgs, config, ... }:
{
  services.podman.containers = {
    portainer = {
      image = "portainer/portainer-ce:latest";
      autoStart = false;
      ports = [
        "9443:9443"
      ];
      volumes = [
      ];
      network = [
        "servarr-net"
      ];
    };
  };
}
