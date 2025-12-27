{ config, pkgs, lib, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};

  # Generate theme.conf content
  themeConf = import ../../sddm-theme/theme.conf.nix {
    theme = selectedTheme;
    wallpaper = selectedTheme.wallpaper;
  };

  # Create the SDDM theme package
  mikoshiTheme = pkgs.stdenv.mkDerivation {
    name = "sddm-mikoshi-theme";
    src = ../../sddm-theme;

    dontBuild = true;
    dontWrapQtApps = true;

    installPhase = ''
      mkdir -p $out/share/sddm/themes/mikoshi

      # Copy QML files
      cp $src/Main.qml $out/share/sddm/themes/mikoshi/
      cp $src/metadata.desktop $out/share/sddm/themes/mikoshi/

      # Generate theme.conf from the Nix expression
      cat > $out/share/sddm/themes/mikoshi/theme.conf << 'EOF'
      ${themeConf}
      EOF
    '';
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "mikoshi";

    settings = {
      Theme = {
        Current = "mikoshi";
        ThemeDir = "${mikoshiTheme}/share/sddm/themes";
        CursorTheme = selectedTheme.cursor;
        Font = selectedTheme.fonts.main;
      };

      General = {
        InputMethod = "";
      };
    };
  };

  # Install SDDM theme and dependencies
  environment.systemPackages = with pkgs; [
    mikoshiTheme
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
  ];
}
