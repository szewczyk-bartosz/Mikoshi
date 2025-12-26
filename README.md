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


# Themes

!!REQ!!

**Theme System:**
- Edit theme in your config file, rebuild to apply
- All theme configs generated from single source

**Theme Switching:**
```nix
# In your configuration:
theme = "arasaka";  # Change this line

# Then rebuild:
sudo nixos-rebuild switch --flake .#yourhostname  # System config
home-manager switch --flake .#youruser           # User config
```

**Included Themes:**
- Akasara - Totally not Arasaka Theme

**Themed Components:**
- Window manager (Hyprland borders, gaps, colors)
- Status bar (Waybar)
- Terminal (Kitty)
- Application launcher (Wofi)
- Notification daemon (Mako)
- Lock screen (Hyprlock)
- Login screen (SDDM)
- Text editor (NixVim)
- File managers (Thunar, Yazi)
- GTK applications
- Qt applications
- Wallpaper
- Cursor theme
- Icon theme

!!REQ!!

# Keybindings

!!REQ!!

**Universal Clipboard:**
- `Ctrl + C` / `Ctrl + V` - Copy/Paste everywhere (terminal included)

**Window Management:**
- `Super + H/J/K/L` - Move focus between windows (Vim-style)
- `Super + Shift + H/J/K/L` - Move windows around
- `Super + Q` - Close window
- `Super + F` - Toggle fullscreen
- `Super + V` - Toggle floating mode

**Workspaces:**
- `Super + [1-9]` - Switch to workspace
- `Super + Shift + [1-9]` - Move window to workspace
- `Super + Tab` - Switch between recent windows (Hyprshell)

**Launchers & Tools:**
- `Super + Return` - Launch terminal
- `Super + Space` - Application launcher
- `Super + Shift + S` - Screenshot
- `Super + L` - Lock screen
- `Super + E` - File manager

**System:**
- `Super + Shift + E` - Exit/logout menu
- `Super + Shift + R` - Reload Hyprland config

**Volume & Brightness:**
- `XF86AudioRaiseVolume/LowerVolume` - Volume control (with popup)
- `XF86MonBrightnessUp/Down` - Brightness control (with popup)

**Theme:**
- `Super + Ctrl + T` - Theme switcher menu

!!REQ!!


# Shell & CLI Tools

!!REQ!!

**Shell:**
- Zsh with Starship prompt
- Syntax highlighting
- Auto-suggestions
- Command history search

**Modern CLI Replacements:**
- `eza` - Better `ls` (colors, icons, git integration)
- `bat` - Better `cat` (syntax highlighting)
- `ripgrep (rg)` - Better `grep` (faster searching)
- `fd` - Better `find` (simpler syntax)
- `zoxide` - Smart `cd` (learns your habits)
- `fzf` - Fuzzy finder (search everything)

**System Monitoring:**
- `btop` - Resource monitor (CPU, RAM, processes)
- `dust` - Disk usage analyzer

**Development:**
- `git` with sensible defaults
- `direnv` - Auto-load project environments
- Language servers for common languages

!!REQ!!

# Applications

!!REQ!!

**Web Browsers:**
- Brave - Privacy-focused, Chromium-based
- qutebrowser - Keyboard-driven, minimal

**Media:**
- Zathura - PDF viewer (keyboard-driven)
- imv - Image viewer
- VLC - Video player
- Custom music player - TUI-based (to be developed)

**Productivity:**
- KeePassXC - Password manager (local, no cloud)
- Obsidian - Note-taking and knowledge management

**Graphics & Recording:**
- GIMP - Image editing
- OBS Studio - Screen recording and streaming

**System Tools:**
- Archive tools - p7zip, unzip, unrar (CLI only)
- CopyQ - Clipboard manager (with encryption support)
- hyprpicker - Color picker

!!REQ!!


# Development Tools

!!REQ!!

**Languages & Toolchains:**
- Nix/NixOS tooling (built-in)
- Rust (rustc, cargo, rust-analyzer)
- Python (python3, pip, pyright LSP)

**Version Management:**
- direnv - Auto-load project environments
- nix-direnv - Faster direnv for Nix projects

**Editor (NixVim):**
- Pre-configured Neovim via NixVim
- LSP support for Rust and Python
- Tree-sitter syntax highlighting
- Fuzzy finding (Telescope)
- File explorer (Neo-tree or nvim-tree)
- Git integration (Gitsigns, Fugitive)
- Auto-completion (nvim-cmp)
- Snippets
- Cyberpunk-themed (matches system theme)

**Git Configuration:**
- Sensible defaults
- Delta (better git diff)
- Lazygit (TUI git interface)

**Debugging:**
- GDB
- LLDB

!!REQ!!


# Audio & Bluetooth

!!REQ!!

**Audio System:**
- PipeWire - Modern audio server (replaces PulseAudio/JACK)
- WirePlumber - PipeWire session manager
- pavucontrol - GUI volume control and audio device management
- Audio controls via media keys with on-screen popup

**Bluetooth:**
- BlueZ - Bluetooth stack
- blueman - GUI Bluetooth manager (system tray applet)
- Bluetooth audio support (A2DP profiles)
- Easy pairing and device management via GUI

**Waybar Integration:**
- Audio module showing volume level
- Click to open pavucontrol
- Bluetooth module showing connection status
- Click to open blueman

!!REQ!!


# Networking

!!REQ!!

**Network Management:**
- NetworkManager - Network connection management
- nm-applet - System tray network applet
- GUI WiFi connection and management
- Ethernet auto-configuration

**Waybar Integration:**
- Network module showing connection status
- WiFi signal strength indicator
- Click to open network menu
- Easy WiFi switching via mouse

**VPN Support:**
- NetworkManager VPN plugins
- OpenVPN support
- WireGuard support

!!REQ!!

# Fonts

!!REQ!!

**System Fonts:**
- Nerd Fonts - Icons and glyphs for terminal/waybar
- JetBrainsMono Nerd Font - Default monospace
- Inter - Default sans-serif
- Noto fonts - Comprehensive Unicode coverage

**Special Support:**
- Emoji fonts (Noto Color Emoji)
- Japanese/Chinese/Korean fonts (Noto CJK)
- Font rendering optimization (FreeType)

**Theme Integration:**
- Fonts automatically themed across all applications
- Consistent sizing and rendering

!!REQ!!

# Power Management

!!REQ!!

**Laptop Support:**
- TLP - Advanced power management
- Battery optimization profiles
- CPU frequency scaling
- Auto-sleep on lid close

**Waybar Integration:**
- Battery module with percentage and status
- Charging indicator
- Time remaining estimate
- Power profile switcher (click to change)

**Screen & Sleep:**
- Auto-screen timeout (configurable)
- Automatic suspend on idle
- Lock on lid close
- Wake on keyboard/mouse

**Brightness Control:**
- Brightness keys with on-screen popup
- Automatic brightness (optional)
- Night light/blue light filter (Hyprsunset/Gammastep)

!!REQ!!

# Hardware Support

!!REQ!!

**Graphics Drivers:**
- Intel - Automatic detection and configuration
- AMD - AMDGPU drivers with Vulkan support
- NVIDIA - Optional module (user enables if needed)

**Input Devices:**
- libinput - Touchpad and mouse configuration
- Touchpad gestures (multi-touch support)
- Natural scrolling (configurable)
- Tap-to-click enabled by default

**Monitor Support:**
- Multi-monitor detection
- Automatic DPI scaling
- HiDPI support (configurable per monitor)
- Display configuration via Hyprland

**Printing:**
- CUPS - Printing system (optional module)
- Network printer discovery

!!REQ!!
