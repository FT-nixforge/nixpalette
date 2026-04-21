# Gruvbox Light — the light variant of the retro groove color scheme.
# https://github.com/morhetz/gruvbox
{
  polarity = "light";

  base16 = {
    base00 = "fbf1c7"; # Light0 (background)
    base01 = "ebdbb2"; # Light1
    base02 = "d5c4a1"; # Light2
    base03 = "bdae93"; # Light3
    base04 = "665c54"; # Dark3
    base05 = "504945"; # Dark2
    base06 = "3c3836"; # Dark1
    base07 = "282828"; # Dark0 (darkest)
    base08 = "9d0006"; # Red (dark)
    base09 = "af3a03"; # Orange (dark)
    base0A = "b57614"; # Yellow (dark)
    base0B = "79740e"; # Green (dark)
    base0C = "427b58"; # Aqua (dark)
    base0D = "076678"; # Blue (dark)
    base0E = "8f3f71"; # Purple (dark)
    base0F = "d65d0e"; # Orange (bright)
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
    applications = 0.98;
    desktop      = 1.0;
    popups       = 0.99;
    terminal     = 0.95;
  };

  wallpaper = null;
  overrides = {};
}
