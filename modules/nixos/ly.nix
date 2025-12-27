{ config, pkgs, lib, ... }:

{
  # Use ly - a TUI display manager with cool matrix rain animation
  # Much simpler than SDDM and fits the cyberpunk aesthetic perfectly
  services.displayManager.ly = {
    enable = true;
    settings = {
      # No animation background
      animation = "none";

      # Custom message displayed above the login box
      initial_info_text = "Wake the fuck up Samurai, we've got a city to burn";
    };
  };

  # Disable other display managers
  services.xserver.displayManager.sddm.enable = lib.mkForce false;
}
