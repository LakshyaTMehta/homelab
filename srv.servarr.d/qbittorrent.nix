{ servarrDir, ... }:
{
  services.podman.containers = {
    qbittorrent = {
      image = "linuxserver/qbittorrent:latest";
      autoStart = true;
      ports = [
        "8080:8080"
      ];
      volumes = [
        "${servarrDir}/data:/data"
        "${servarrDir}/qbittorrent:/config"
      ];
      environment = {
	PUID = "1000";
	PGID = "1000";
        TZ = "Asia/Kolkata";
	WEBUI_PORT = "8080";
      };
      network = [
        "servarr-net"
      ];
      ip4 = "10.10.0.2";
    };
  };
}
