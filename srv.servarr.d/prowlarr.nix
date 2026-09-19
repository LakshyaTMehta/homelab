{ servarrDir, ... }:
{
  services.podman.containers = {
    prowlarr = {
      image = "linuxserver/prowlarr:latest";
      autoStart = true;
      environment = {
	PUID = "1000";
	PGID = "1000";
        TZ = "Asia/Kolkata";
      };
      ports = [
        "9696:9696"
      ];
      volumes = [
        "${servarrDir}/prowlarr/config:/config"
	"/etc/localtime:/etc/localtime"
      ];
      network = [
        "servarr-net"
      ];
      ip4 = "10.10.0.3";
    };
  };
}
