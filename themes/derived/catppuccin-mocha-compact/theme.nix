# Catppuccin Mocha Compact — smaller font sizes for dense layouts.
# Inherits all colors and settings from catppuccin-mocha,
# swaps the monospace font to Iosevka, and reduces all font sizes.
{
  parent = "builtin:base/catppuccin-mocha";

  fonts = {
    monospace = {
      name    = "Iosevka";
      package = "iosevka";
    };
    sizes = {
      applications = 10;
      desktop      = 9;
      popups       = 9;
      terminal     = 11;
    };
  };
}
