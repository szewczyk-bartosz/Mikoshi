{ selectedTheme, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        "col.active_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.primary})";
        "col.inactive_border" = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.secondary})";
      };
    };

  };

}
