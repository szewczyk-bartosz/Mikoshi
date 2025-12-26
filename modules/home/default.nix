{ username, hostname, theme, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${theme};
in 
{
  imports = [ ./hyprland.nix ./kitty.nix];

  _module.args.selectedTheme = selectedTheme;
}
