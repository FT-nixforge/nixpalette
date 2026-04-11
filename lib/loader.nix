# Theme discovery and loading.
# Scans a theme root directory for base/ and derived/ subdirectories,
# imports each theme's definition, and returns a namespaced registry.
{ lib }:

let
  # List directory names inside a category directory (base/ or derived/).
  discoverThemeNames = categoryDir:
    if builtins.pathExists categoryDir then
      lib.attrNames
        (lib.filterAttrs (_: type: type == "directory") (builtins.readDir categoryDir))
    else
      [];

  # Import a single theme from its directory.
  # Every theme directory MUST contain a theme.nix file.
  loadTheme = themeDir:
    let
      themePath = themeDir + "/theme.nix";
      metaPath  = themeDir + "/meta.nix";
    in
    if builtins.pathExists themePath then {
      definition = import themePath;
      meta       = if builtins.pathExists metaPath then import metaPath else {};
      dir        = themeDir;
    }
    else
      builtins.throw
        "nixpalette: theme.nix not found in ${toString themeDir}. Every theme folder must contain a theme.nix file.";

  # Load all themes under a single root directory, tagging each with a namespace.
  # Returns an attrset keyed by namespaced IDs like "builtin:base/catppuccin-mocha".
  loadThemesFromRoot = namespace: root:
    let
      loadCategory = category:
        let
          categoryDir = root + "/${category}";
          names       = discoverThemeNames categoryDir;
        in
        map (name: {
          name  = "${namespace}:${category}/${name}";
          value = loadTheme (categoryDir + "/${name}");
        }) names;
    in
    builtins.listToAttrs (
      (loadCategory "base") ++ (loadCategory "derived")
    );

  # Combine builtin themes (shipped with the flake) and user themes into one registry.
  loadAllThemes = { builtinRoot, userRoot ? null }:
    let
      builtinThemes = loadThemesFromRoot "builtin" builtinRoot;
      userThemes =
        if userRoot != null
        then loadThemesFromRoot "user" userRoot
        else {};
    in
    builtinThemes // userThemes;

in
{
  inherit loadThemesFromRoot loadAllThemes;
}
