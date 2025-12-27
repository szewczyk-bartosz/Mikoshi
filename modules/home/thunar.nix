{ pkgs, ... }:

{
  # Thunar file manager and plugins
  home.packages = with pkgs; [
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler # Thumbnail support
    ffmpegthumbnailer # Video thumbnails
  ];

}
