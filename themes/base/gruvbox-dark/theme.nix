# Gruvbox Dark — a retro groove color scheme with warm earthy tones.
# https://github.com/morhetz/gruvbox
{
  polarity = "dark";

  base16 = {
    base00 = "1d2021"; # Hard background
    base01 = "3c3836"; # Dark1
    base02 = "504945"; # Dark2
    base03 = "665c54"; # Dark3
    base04 = "bdae93"; # Light3
    base05 = "d5c4a1"; # Light2
    base06 = "ebdbb2"; # Light1
    base07 = "fbf1c7"; # Light0
    base08 = "fb4934"; # Red (bright)
    base09 = "fe8019"; # Orange
    base0A = "fabd2f"; # Yellow
    base0B = "b8bb26"; # Green (bright)
    base0C = "8ec07c"; # Aqua (bright)
    base0D = "83a598"; # Blue (bright)
    base0E = "d3869b"; # Purple (bright)
    base0F = "d65d0e"; # Orange (dark)
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
      name    = "Iosevka";
      package = "iosevka";
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
