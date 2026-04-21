# Nord — an arctic, north-bluish color palette.
# https://www.nordtheme.com
{
  polarity = "dark";

  base16 = {
    base00 = "2e3440"; # Polar Night (darkest)
    base01 = "3b4252"; # Polar Night
    base02 = "434c5e"; # Polar Night
    base03 = "4c566a"; # Polar Night (lightest)
    base04 = "d8dee9"; # Snow Storm (darkest)
    base05 = "e5e9f0"; # Snow Storm
    base06 = "eceff4"; # Snow Storm (brightest)
    base07 = "8fbcbb"; # Frost (teal)
    base08 = "bf616a"; # Aurora Red
    base09 = "d08770"; # Aurora Orange
    base0A = "ebcb8b"; # Aurora Yellow
    base0B = "a3be8c"; # Aurora Green
    base0C = "88c0d0"; # Frost (light blue)
    base0D = "81a1c1"; # Frost (blue)
    base0E = "b48ead"; # Aurora Purple
    base0F = "5e81ac"; # Frost (deep blue)
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
      applications = 11;
      desktop      = 10;
      popups       = 10;
      terminal     = 12;
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
