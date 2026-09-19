{ servarrDir, ... }:
{
  services.podman.containers = {
    radarr = {
      image = "linuxserver/radarr:latest";
      autoStart = true;
      environment = {
	PUID = "1000";
	PGID = "1000";
        TZ = "Asia/Kolkata";
      };
      ports = [
        "7878:7878"
      ];
      volumes = [
        "/etc/localtime:/etc/localtime"
        "${servarrDir}/data:/data"
        "${servarrDir}/radarr/config:/config"
      ];
      network = [ 
        "servarr-net"
      ];
      ip4 = "10.10.0.5";
    };
  };
}
