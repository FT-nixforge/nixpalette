# Translates a resolved ft-nixpalette theme into Stylix option values.
# All theme-provided values use mkDefault so users can override them
# either through stylixOverrides or by setting stylix.* directly.
{ lib, pkgs, resolvedTheme, stylixOverrides, wallpaper }:

let
  fonts          = resolvedTheme.fonts or {};
  cursorTheme    = resolvedTheme.cursor or {};
  opacityTheme   = resolvedTheme.opacity or {};
  themeOverrides = resolvedTheme.overrides or {};
  hasFonts       = fonts != {};
  hasCursor      = cursorTheme != {};
  hasOpacity     = opacityTheme != {};
  hasWallpaper   = resolvedTheme ? wallpaper && resolvedTheme.wallpaper != null;

  # Generate a solid-color wallpaper from the theme's background color.
  # Last-resort fallback when neither the theme nor the user provides a wallpaper.
  fallbackWallpaper = pkgs.runCommand "ft-nixpalette-wallpaper.png" {
    nativeBuildInputs = [ pkgs.imagemagick ];
  } ''
    magick -size 3840x2160 xc:'#${resolvedTheme.base16.base00}' png:$out
  '';

  # Wallpaper priority:
  #   1. Theme-specific wallpaper (theme.wallpaper != null)
  #   2. "ft-nixpalette".defaultWallpaper (user override or flake root wallpaper image)
  #   3. Auto-generated solid-color PNG from base00
  activeWallpaper =
    if hasWallpaper          then resolvedTheme.wallpaper
    else if wallpaper != null then wallpaper
    else                           fallbackWallpaper;

  # Resolve a package from a string reference.
  # Supports dot-separated paths (e.g. "nerd-fonts.jetbrains-mono") as well as
  # top-level attribute names (e.g. "inter").
  resolvePkg = subject: packageRef:
    let
      segments = lib.splitString "." packageRef;
      resolved = lib.attrByPath segments null pkgs;
    in
    if resolved != null then
      resolved
    else
      builtins.throw
        ("ft-nixpalette: Package '${packageRef}' (for ${subject}) not found in nixpkgs. "
        + "Check the package name in your theme definition.");

  mkFontRole = role:
    if builtins.hasAttr role fonts then
      let
        font = builtins.getAttr role fonts;
      in
      {
        fonts = {
          "${role}" = {
            name    = lib.mkDefault font.name;
            package = lib.mkDefault (resolvePkg "fonts.${role}" font.package);
          };
        };
      }
    else
      {};

in
lib.mkMerge [
  {
    enable       = true;
    base16Scheme = lib.mkDefault resolvedTheme.base16;
    polarity     = lib.mkDefault resolvedTheme.polarity;
    image        = lib.mkDefault activeWallpaper;
  }

  (lib.mkIf hasFonts (lib.mkMerge [
    (mkFontRole "serif")
    (mkFontRole "sansSerif")
    (mkFontRole "monospace")
    (mkFontRole "emoji")
    (lib.mkIf (builtins.hasAttr "sizes" fonts) {
      fonts.sizes = {
        applications = lib.mkDefault (fonts.sizes.applications or 12);
        desktop      = lib.mkDefault (fonts.sizes.desktop or 11);
        popups       = lib.mkDefault (fonts.sizes.popups or 10);
        terminal     = lib.mkDefault (fonts.sizes.terminal or 13);
      };
    })
  ]))

  (lib.mkIf hasCursor {
    cursor = lib.mkMerge [
      (lib.optionalAttrs (builtins.hasAttr "name" cursorTheme) {
        name = lib.mkDefault cursorTheme.name;
      })
      (lib.optionalAttrs (builtins.hasAttr "package" cursorTheme) {
        package = lib.mkDefault (resolvePkg "cursor" cursorTheme.package);
      })
      (lib.optionalAttrs (builtins.hasAttr "size" cursorTheme) {
        size = lib.mkDefault cursorTheme.size;
      })
    ];
  })

  (lib.mkIf hasOpacity {
    opacity = lib.mapAttrs (_: value: lib.mkDefault value) opacityTheme;
  })

  themeOverrides

  stylixOverrides
]
