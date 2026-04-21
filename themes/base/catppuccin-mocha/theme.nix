# Catppuccin Mocha — a warm, dark color scheme.
# https://catppuccin.com
{
  polarity = "dark";

  base16 = {
    base00 = "1e1e2e"; # Base
    base01 = "181825"; # Mantle
    base02 = "313244"; # Surface0
    base03 = "45475a"; # Surface1
    base04 = "585b70"; # Surface2
    base05 = "cdd6f4"; # Text
    base06 = "f5e0dc"; # Rosewater
    base07 = "b4befe"; # Lavender
    base08 = "f38ba8"; # Red
    base09 = "fab387"; # Peach
    base0A = "f9e2af"; # Yellow
    base0B = "a6e3a1"; # Green
    base0C = "94e2d5"; # Teal
    base0D = "89b4fa"; # Blue
    base0E = "cba6f7"; # Mauve
    base0F = "f2cdcd"; # Flamingo
  };

  fonts = {
    serif = {
      name    = "Noto Serif";
      package = "noto-fonts";
    };
    sansSerif = {
      name    = "Inter";
      package = "inter";
    };
    monospace = {
      name    = "JetBrains Mono";
      package = "jetbrains-mono";
    };
    emoji = {
      name    = "Noto Color Emoji";
      package = "noto-fonts-color-emoji";
    };
    sizes = {
      applications = 12;
      desktop      = 11;
      popups       = 10;
      terminal     = 13;
    };
  };

  cursor.size = 24;

  opacity = {
    applications = 0.96;
    desktop      = 1.0;
    popups       = 0.98;
    terminal     = 0.93;
  };

  # Set to a path (e.g. ./wallpaper.png) to ship a wallpaper with the theme.
  # When null, ft-nixpalette falls back to the configured default wallpaper
  # or generates a solid-color wallpaper from the color scheme.
  wallpaper = null;

  # Extra Stylix overrides merged on top of the theme defaults.
  overrides = {};
}
