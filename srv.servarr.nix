{ pkgs, config, servarrDir, ... }:
{
  imports = [
    srv.servarr.d/qbittorrent.nix
    srv.servarr.d/flaresolverr.nix
    srv.servarr.d/prowlarr.nix
    srv.servarr.d/radarr.nix
    srv.servarr.d/sonarr.nix
    srv.servarr.d/seerr.nix
  ];

  services.podman.networks.servarr-net = {
    description = "servarr.ferb.home.arpa";
    autoStart = true;
    driver = "bridge";
    gateway = "10.10.0.1";
    subnet = "10.10.0.0/24";
    internal = false;
    labels = {
      service = "servarr";
      network = "servarr.ferb.home.arpa";
    };
  };

}
