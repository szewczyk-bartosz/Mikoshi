{ lib, pkgs, home-manager, ... }:

{
  options = {
    mikoshi.username = lib.mkOption { default = "cheryllamb"; type = lib.types.str; };
    mikoshi.hostname = lib.mkOption { default = "m1k1"; type = lib.types.str; };
    mikoshi.theme = lib.mkOption { default = "akasara"; type = lib.types.str; };
  };

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
