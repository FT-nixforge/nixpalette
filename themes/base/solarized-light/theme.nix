# Solarized Light — the light variant of the precision Solarized scheme.
# https://ethanschoonover.com/solarized
{
  polarity = "light";

  base16 = {
    base00 = "fdf6e3"; # Base3 (background)
    base01 = "eee8d5"; # Base2
    base02 = "93a1a1"; # Base1
    base03 = "839496"; # Base0 (comments)
    base04 = "657b83"; # Base00
    base05 = "586e75"; # Base01 (body text)
    base06 = "073642"; # Base02
    base07 = "002b36"; # Base03 (darkest)
    base08 = "dc322f"; # Red
    base09 = "cb4b16"; # Orange
    base0A = "b58900"; # Yellow
    base0B = "859900"; # Green
    base0C = "2aa198"; # Cyan
    base0D = "268bd2"; # Blue
    base0E = "6c71c4"; # Violet
    base0F = "d33682"; # Magenta
  };

  fonts = {
    serif = {
      name    = "Source Serif 4";
      package = "source-serif";
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
    applications = 0.98;
    desktop      = 1.0;
    popups       = 0.99;
    terminal     = 0.95;
  };

  wallpaper = null;
  overrides = {};
}
