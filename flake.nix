{
  description = "nixpalette — a reusable NixOS theme framework built on Stylix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, stylix, ... }:
  let
    nixpaletteLib    = import ./lib { inherit (nixpkgs) lib; };
    builtinThemesDir = ./themes;
    # Use the flake-root wallpaper.png as the default for all themes when present.
    # Evaluates to null if the file does not exist, triggering the solid-color fallback.
    defaultWallpaper =
      if builtins.pathExists ./wallpaper.png then ./wallpaper.png else null;
  in
  {
    lib = nixpaletteLib;

    nixosModules.default = {
      imports = [
        stylix.nixosModules.stylix
        (import ./modules/nixos.nix { inherit nixpaletteLib builtinThemesDir defaultWallpaper; })
      ];
    };

    homeModules.default = {
      imports = [
        stylix.homeModules.stylix
        (import ./modules/hm.nix { inherit nixpaletteLib builtinThemesDir defaultWallpaper; })
      ];
    };
  };
}
