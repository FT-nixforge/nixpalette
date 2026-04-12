# Translates a resolved nixpalette theme into Stylix option values.
# All theme-provided values use mkDefault so users can override them
# either through stylixOverrides or by setting stylix.* directly.
{ lib, pkgs, resolvedTheme, stylixOverrides, wallpaper }:

let
  fonts        = resolvedTheme.fonts or {};
  hasFonts     = fonts != {};
  hasWallpaper = resolvedTheme ? wallpaper && resolvedTheme.wallpaper != null;

  # Generate a solid-color wallpaper from the theme's background color.
  # Last-resort fallback when neither the theme nor the user provides a wallpaper.
  fallbackWallpaper = pkgs.runCommand "nixpalette-wallpaper.png" {
    nativeBuildInputs = [ pkgs.imagemagick ];
  } ''
    magick -size 3840x2160 xc:'#${resolvedTheme.base16.base00}' png:$out
  '';

  # Wallpaper priority:
  #   1. Theme-specific wallpaper (theme.wallpaper != null)
  #   2. nixpalette.defaultWallpaper (user override or flake root wallpaper.png)
  #   3. Auto-generated solid-color PNG from base00
  activeWallpaper =
    if hasWallpaper          then resolvedTheme.wallpaper
    else if wallpaper != null then wallpaper
    else                           fallbackWallpaper;

  # Resolve a font package from a string reference.
  # Supports dot-separated paths (e.g. "nerd-fonts.jetbrains-mono") as well as
  # top-level attribute names (e.g. "inter").
  resolveFontPkg = role: packageRef:
    let
      segments = lib.splitString "." packageRef;
      resolved = lib.attrByPath segments null pkgs;
    in
    if resolved != null then
      resolved
    else
      builtins.throw
        ("nixpalette: Font package '${packageRef}' (for ${role}) not found in nixpkgs. "
        + "Check the package name in your theme's fonts.${role}.package field.");

in
lib.mkMerge [
  {
    enable       = true;
    base16Scheme = lib.mkDefault resolvedTheme.base16;
    polarity     = lib.mkDefault resolvedTheme.polarity;
    image        = lib.mkDefault activeWallpaper;
  }

  (lib.mkIf hasFonts {
    fonts.serif = {
      name    = lib.mkDefault fonts.serif.name;
      package = lib.mkDefault (resolveFontPkg "serif" fonts.serif.package);
    };
    fonts.sansSerif = {
      name    = lib.mkDefault fonts.sansSerif.name;
      package = lib.mkDefault (resolveFontPkg "sansSerif" fonts.sansSerif.package);
    };
    fonts.monospace = {
      name    = lib.mkDefault fonts.monospace.name;
      package = lib.mkDefault (resolveFontPkg "monospace" fonts.monospace.package);
    };
    fonts.emoji = {
      name    = lib.mkDefault fonts.emoji.name;
      package = lib.mkDefault (resolveFontPkg "emoji" fonts.emoji.package);
    };
    fonts.sizes = {
      applications = lib.mkDefault (fonts.sizes.applications or 12);
      desktop      = lib.mkDefault (fonts.sizes.desktop or 11);
      popups       = lib.mkDefault (fonts.sizes.popups or 10);
      terminal     = lib.mkDefault (fonts.sizes.terminal or 13);
    };
  })

  stylixOverrides
]
