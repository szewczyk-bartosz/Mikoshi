{ pkgs, config, ... }:

{
  config = {
    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [
      vim
      git
    ];
  };
}
