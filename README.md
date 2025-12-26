For now, the README is just so I can lay out the design


# Core Philosophy
- Works out of the box
- Keyboard first
- Coherent themes
- Complete
- Clear to user
- Minimal nix knowledge required

# Installation
Installation needs to be one command only from a nixos ISO !REQ!
Swapping existing nixOS to Mikoshi should be easy !REQ!

# Core components
!!REQ!!
Compositor: Hyprland
Window Switcher: Hyprshell
Status Bar: Waybar
Launcher: Wofi
Notifications: Mako
Lock Screen: Hyprlock
Wallpapers: swww
Screenshots: Grimblast
Display Manager: SDDM
Terminal Emulator: Kitty
File Viewer GUI: Thunar
File Viewer TUI: Yazi
Editor: NixVim
!!REQ!!

# Theming 
Themes are an important thing in this system and need to be instantenous to apply and easy to swap / edit 

!!REQ!!
Themes need to be applied to the following automatically:
 Window manager (Hyprland borders, gaps, colors)
 Status bar (Waybar)
 Terminal (Kitty/Alacritty)
 Application launcher (Rofi/Wofi)
 Notification daemon (Mako/Dunst)
 Lock screen (Hyprlock/Swaylock)
 Text editor (Neovim/Helix)
 File manager
 GTK applications
 Qt applications
 Wallpaper
 Cursor theme
 Icon theme
!!REQ!!


