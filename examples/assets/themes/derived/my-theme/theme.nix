# Example: A user-defined derived theme.
# Place this in your flake's assets/themes/derived/my-theme/ directory.
#
# This theme inherits everything from catppuccin-mocha and overrides
# a few accent colors, the monospace font, and the terminal font size.
#
# To use it, set:
#   nixpalette.theme = "user:derived/my-theme";
#   nixpalette.userThemeDir = ./assets/themes;
{
  parent = "builtin:base/catppuccin-mocha";

  # Override accent colors
  base16 = {
    base0D = "7aa2f7"; # Custom blue accent
    base0E = "bb9af7"; # Custom purple accent
  };

  # Override monospace font and terminal size
  fonts = {
    monospace = {
      name    = "Cascadia Code";
      package = "cascadia-code";
    };
    sizes = {
      terminal = 14;
    };
  };

  # Uncomment to ship a wallpaper with this theme:
  # wallpaper = ./wallpaper.jpg;
}
