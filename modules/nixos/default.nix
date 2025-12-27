{ lib, pkgs, config, home-manager, ... }:

{

  config = {
    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [
      vim
      git
    ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.users.${config.mikoshi.username} = {
      imports = [ ../home ];
      home.stateVersion = "25.11";
    };

    home-manager.extraSpecialArgs = {
      username = config.mikoshi.username;
      hostname = config.mikoshi.hostname;
      theme = config.mikoshi.theme;
    };
  };
}
