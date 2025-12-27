{ pkgs, ... }:

{
  # Thunar file manager and plugins
  home.packages = with pkgs; [
    nerd-fonts._3270
    nerd-fonts.agave
    nerd-fonts.envy-code-r
  ];

}
