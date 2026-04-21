# Tokyo Night — a clean dark theme inspired by the city lights of Tokyo.
# https://github.com/enkia/tokyo-night-vscode-theme
{
  polarity = "dark";

  base16 = {
    base00 = "1a1b26"; # Background
    base01 = "16161e"; # Background dark
    base02 = "2f3549"; # Selection
    base03 = "444b6a"; # Comments
    base04 = "787c99"; # Dark foreground
    base05 = "a9b1d6"; # Foreground
    base06 = "cbccd1"; # Light foreground
    base07 = "d5d6db"; # Bright white
    base08 = "f7768e"; # Red
    base09 = "ff9e64"; # Orange
    base0A = "e0af68"; # Yellow
    base0B = "9ece6a"; # Green
    base0C = "73daca"; # Cyan
    base0D = "7aa2f7"; # Blue
    base0E = "bb9af7"; # Purple
    base0F = "db4b4b"; # Dark red
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

  wallpaper = null;
  overrides = {};
}
