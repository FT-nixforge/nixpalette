# Translates a resolved nixpalette theme into Stylix option values.
# All theme-provided values use mkDefault so users can override them
# either through stylixOverrides or by setting stylix.* directly.
{ lib, pkgs, resolvedTheme, stylixOverrides }:

let
  fonts        = resolvedTheme.fonts or {};
  hasFonts     = fonts != {};
  hasWallpaper = resolvedTheme ? wallpaper && resolvedTheme.wallpaper != null;

  resolveFontPkg = role: packageName:
    if builtins.hasAttr packageName pkgs then
      pkgs.${packageName}
    else
      builtins.throw
        ("nixpalette: Font package '${packageName}' (for ${role}) not found in nixpkgs. "
        + "Check the package name in your theme's fonts.${role}.package field.");

in
lib.mkMerge [
  {
    enable       = true;
    base16Scheme = lib.mkDefault resolvedTheme.base16;
    polarity     = lib.mkDefault resolvedTheme.polarity;
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

  (lib.mkIf hasWallpaper {
    image = lib.mkDefault resolvedTheme.wallpaper;
  })

  stylixOverrides
]
