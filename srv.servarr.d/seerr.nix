{ servarrDir, ... }:
{
  services.podman.containers = {
    seerr = {
      image = "seerr-team/seerr:latest";
      autoStart = true;
      environment = {
	PUID = "1000";
	PGID = "1000";
        LOG_LEVEL = "debug";
	TZ = "Asia/Kolkata";
      };
      ports = [
        "5055:5055"
      ];
      volumes = [
        "${servarrDir}/seerr/config:/app/config"
      ];
      network = [
        "servarr-net"
      ];
      ip4 = "10.10.0.7";
      extraPodmanArgs = [
        "--add-host=host.containers.internal:host-gateway"
      ];
    };
  };
}
