# One Dark — Atom's iconic dark theme, ported to the base16 ecosystem.
# https://github.com/atom/one-dark-syntax
{
  polarity = "dark";

  base16 = {
    base00 = "282c34"; # Background
    base01 = "353b45"; # Lighter background
    base02 = "3e4451"; # Selection
    base03 = "545862"; # Comments
    base04 = "565c64"; # Dark foreground
    base05 = "abb2bf"; # Foreground
    base06 = "b6bdca"; # Light foreground
    base07 = "c8ccd4"; # Bright white
    base08 = "e06c75"; # Red
    base09 = "d19a66"; # Orange
    base0A = "e5c07b"; # Yellow
    base0B = "98c379"; # Green
    base0C = "56b6c2"; # Cyan
    base0D = "61afef"; # Blue
    base0E = "c678dd"; # Purple
    base0F = "be5046"; # Dark red
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
