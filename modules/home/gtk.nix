{ config, pkgs, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  gtk = {
    enable = true;

    iconTheme = {
      name = selectedTheme.icon;
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = selectedTheme.cursor;
      package = pkgs.bibata-cursors;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    font = {
      name = selectedTheme.fonts.main;
      size = selectedTheme.fonts.size;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk3.extraCss = ''
      /* Custom Thunar and GTK styling to match theme */
      window,
      .background {
        background-color: ${selectedTheme.colours.bg};
        color: ${selectedTheme.colours.fg};
      }

      /* Sidebar */
      .sidebar,
      .sidebar .view {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
      }

      .sidebar .view:hover {
        background-color: ${selectedTheme.colours.hover};
      }

      .sidebar .view:selected,
      .sidebar .view:selected:hover {
        background-color: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.onPrimary};
      }

      /* Headerbar */
      headerbar,
      .titlebar {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
        border-bottom: 2px solid ${selectedTheme.colours.primary};
      }

      headerbar button,
      .titlebar button {
        color: ${selectedTheme.colours.fg};
      }

      headerbar button:hover,
      .titlebar button:hover {
        background-color: ${selectedTheme.colours.hover};
      }

      headerbar button:active,
      .titlebar button:active {
        background-color: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.onPrimary};
      }

      /* File view */
      .view,
      iconview,
      treeview {
        background-color: ${selectedTheme.colours.bg};
        color: ${selectedTheme.colours.fg};
      }

      .view:selected,
      iconview:selected,
      treeview:selected {
        background-color: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.onPrimary};
      }

      /* Scrollbars */
      scrollbar {
        background-color: ${selectedTheme.colours.bg};
      }

      scrollbar slider {
        background-color: ${selectedTheme.colours.fgAlt};
        border-radius: 10px;
      }

      scrollbar slider:hover {
        background-color: ${selectedTheme.colours.primary};
      }

      /* Buttons */
      button {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
        border: 1px solid ${selectedTheme.colours.border};
      }

      button:hover {
        background-color: ${selectedTheme.colours.hover};
      }

      button:active {
        background-color: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.onPrimary};
      }

      /* Entry fields */
      entry {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
        border: 1px solid ${selectedTheme.colours.border};
      }

      entry:focus {
        border-color: ${selectedTheme.colours.primary};
        box-shadow: 0 0 5px ${selectedTheme.colours.primary};
      }

      /* Menus */
      menu,
      .menu {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
        border: 1px solid ${selectedTheme.colours.primary};
      }

      menuitem:hover {
        background-color: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.onPrimary};
      }

      /* Tooltips */
      tooltip {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
        border: 1px solid ${selectedTheme.colours.primary};
      }
    '';

    gtk4.extraCss = ''
      /* Custom GTK4 styling to match theme */
      window,
      .background {
        background-color: ${selectedTheme.colours.bg};
        color: ${selectedTheme.colours.fg};
      }

      .sidebar {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
      }

      headerbar {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
        border-bottom: 2px solid ${selectedTheme.colours.primary};
      }

      button {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
        border: 1px solid ${selectedTheme.colours.border};
      }

      button:hover {
        background-color: ${selectedTheme.colours.hover};
      }

      button:active {
        background-color: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.onPrimary};
      }

      entry {
        background-color: ${selectedTheme.colours.bgAlt};
        color: ${selectedTheme.colours.fg};
        border: 1px solid ${selectedTheme.colours.border};
      }

      entry:focus {
        border-color: ${selectedTheme.colours.primary};
        box-shadow: 0 0 5px ${selectedTheme.colours.primary};
      }
    '';
  };

  # Qt theming to match GTK
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    papirus-icon-theme
    bibata-cursors
    adwaita-icon-theme
  ];

  # Set environment variables for consistent theming
  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
    XCURSOR_THEME = selectedTheme.cursor;
  };
}
