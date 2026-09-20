{ pkgs, ... }:
let
    gstreamer = pkgs.gst_all_1.gstreamer;
    gstPlugins = with pkgs.gst_all_1; [
        gstreamer.out
        gst-plugins-base
        gst-plugins-good
        gst-plugins-bad
        gst-plugins-ugly
        gst-libav
    ];
    gstPluginPath = pkgs.lib.makeSearchPath "lib/gstreamer-1.0" ( gstPlugins ++ [ pkgs.pipewire ] );
in
{
    home.packages = gstPlugins ++ [ gstreamer pkgs.pipewire ] ;
    home.sessionVariables = {
        GST_PLUGIN_PATH = "${gstPluginPath}";
        GST_PLUGIN_SYSTEM_PATH_1_0 = "${gstPluginPath}";
    };
}
