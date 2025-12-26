{ selectedTheme, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      bind = [
        "$mainMod, Return exec, $terminal"
        "$mainMod SHIFT, Q, killactive"
        "$mainMod SHIFT, O, exit"
      ];
      general = {
        "$mainMod" = "ALT";
        "$terminal" = "kitty";
        "col.active_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.primary})";
        "col.inactive_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.secondary})";
      };
    };
  };

}
