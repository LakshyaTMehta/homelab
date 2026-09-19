{ servarrDir, ... }:
{
  services.podman.containers = {
    sonarr = {
      image = "linuxserver/sonarr:latest";
      autoStart = true;
      environment = {
	    PUID = "1000";
	    PGID = "1000";
        TZ = "Asia/Kolkata";
      };
      ports = [
        "8989:8989"
      ];
      volumes = [
        "/etc/localtime:/etc/localtime"
        "${servarrDir}/data:/data"
        "${servarrDir}/sonarr/config:/config"
      ];
      network = [
        "servarr-net"
      ];
      ip4 = "10.10.0.6";
    };
  };
}
