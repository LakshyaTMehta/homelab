{ pkgs, config, ... }:
{
    imports = [
        srv.esp32cam-gst-v4l2.d/gstreamer.nix
        srv.esp32cam-gst-v4l2.d/srv.systemd.nix
    ];
}
