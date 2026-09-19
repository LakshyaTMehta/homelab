{
  services.podman.containers = {
    flaresolverr = {
      image = "flaresolverr/flaresolverr:latest";
      autoStart = true;
      environment = {
        TZ = "Asia/Kolkata";
	LOG_LEVEL = "info";
	LOG_HTML = "false";
	CAPTCHA_SOLVERR = "none";
      };
      network = [
        "servarr-net"
      ];
      ip4 = "10.10.0.4";
    };
  };
}
