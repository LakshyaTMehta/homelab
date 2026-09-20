{ pkgs, config, ... }:
let
    gstreamer = pkgs.gst_all_1.gstreamer;
    esp32camSource = pkgs.writeShellScript "esp32cam-source" ''
    exec ${gstreamer}/bin/gst-launch-1.0 -v \
        souphttpsrc \
            location=http://192.168.1.202:81/stream \
            is-live=true \
            do-timestamp=true \
        ! "multipart/x-mixed-replace,boundary=(string)123456789000000000000987654321" \
        ! multipartdemux \
        ! queue max-size-buffers=2 leaky=downstream \
        ! jpegdec \
        ! videoscale \
        ! videoconvert \
        ! queue max-size-buffers=2 leaky=downstream \
        ! v4l2sink device=/dev/video10
    '';
        #! pipewiresink \
        #    sync=false \
        #    mode=provide \
        #    processing-deadline=0 \
        #    client-name="ESP32-CAM Source" \
        #    stream-properties="properties,media.class=Video/Source,node.name=esp32cam,node.description=esp32cam"
in
{
    systemd.user.services.esp32cam-pwnode-service = {
        Unit = {
            Description = "Expose BAR-25 esp32cam node as a pipewire device";
            After = [
                "network-online.target"
                "pipewire.service"
            ];
            Wants = [
                "network-online.target"
                "pipewire.service"
            ];
        };
        Service = {
            ExecStart = esp32camSource;
            Environment = [
                "GST_PLUGIN_PATH=${config.home.sessionVariables.GST_PLUGIN_PATH}"
                "GST_PLUGIN_SYSTEM_PATH_1_0=${config.home.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0}"
            ];
            Restart = "always";
            RestartSec = 10;
        };
        Install = {
            WantedBy = [ "default.target" ];
        };
    };
}
