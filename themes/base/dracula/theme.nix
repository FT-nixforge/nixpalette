# Dracula — a dark theme with vivid purple and pink accents.
# https://draculatheme.com
{
  polarity = "dark";

  base16 = {
    base00 = "282a36"; # Background
    base01 = "44475a"; # Current Line
    base02 = "44475a"; # Selection
    base03 = "6272a4"; # Comment
    base04 = "8be9fd"; # Cyan (UI chrome)
    base05 = "f8f8f2"; # Foreground
    base06 = "f8f8f2"; # Foreground bright
    base07 = "ffffff"; # White
    base08 = "ff5555"; # Red
    base09 = "ffb86c"; # Orange
    base0A = "f1fa8c"; # Yellow
    base0B = "50fa7b"; # Green
    base0C = "8be9fd"; # Cyan
    base0D = "6272a4"; # Blue/Comment
    base0E = "bd93f9"; # Purple
    base0F = "ff79c6"; # Pink
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
      name    = "Fira Code";
      package = "fira-code";
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
