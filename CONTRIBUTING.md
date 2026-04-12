# Contributing to nixpalette

Thank you for considering a contribution! This document explains how the project is structured, what kind of contributions are welcome, and how to submit them.

## What we welcome

- **New built-in themes** — additional base or derived themes with accurate base16 palettes
- **Bug fixes** — incorrect color values, broken inheritance, module evaluation errors
- **Feature improvements** — enhancements to the loader, resolver, or module options
- **Documentation** — corrections, clarifications, or new usage examples
- **Workflow / CI improvements**

## Project structure

```
nixpalette/
├── flake.nix                  # Flake entry point
├── lib/
│   ├── loader.nix             # Theme discovery (builtins.readDir)
│   ├── resolver.nix           # Inheritance resolution + cycle detection
│   └── default.nix            # Re-exports
├── modules/
│   ├── nixos.nix              # NixOS module (options + config)
│   ├── hm.nix                 # Home Manager module
│   └── stylix.nix             # Theme → Stylix translation layer
└── themes/
    ├── base/                  # Self-contained themes (no parent)
    │   └── <name>/
    │       ├── theme.nix
    │       └── meta.nix
    └── derived/               # Themes that inherit from a base theme
        └── <name>/
            ├── theme.nix      # Only overrides — parent fills the rest
            └── meta.nix
```

## Adding a built-in theme

### 1. Choose the right category

- **`themes/base/`** — standalone themes with a full base16 palette
- **`themes/derived/`** — themes that inherit from an existing base theme and only override specific fields (e.g. fonts, sizes)

### 2. Create the theme directory

```
themes/base/<your-theme-name>/
```

Use lowercase kebab-case for the directory name. It becomes the theme's ID:
`builtin:base/<your-theme-name>`

### 3. Write `theme.nix`

A base theme must define all required fields:

```nix
{
  polarity = "dark"; # or "light"

  base16 = {
    base00 = "rrggbb"; # background (no leading #)
    base01 = "rrggbb";
    base02 = "rrggbb";
    base03 = "rrggbb";
    base04 = "rrggbb";
    base05 = "rrggbb"; # foreground / body text
    base06 = "rrggbb";
    base07 = "rrggbb";
    base08 = "rrggbb"; # red / variables
    base09 = "rrggbb"; # orange / integers
    base0A = "rrggbb"; # yellow / classes
    base0B = "rrggbb"; # green / strings
    base0C = "rrggbb"; # cyan / support
    base0D = "rrggbb"; # blue / functions
    base0E = "rrggbb"; # purple / keywords
    base0F = "rrggbb"; # deprecated / misc
  };

  # Optional: include fonts. Omit entirely if you have no preference.
  # fonts = { ... };

  # Set to a path (e.g. ./wallpaper.png) or leave null for auto-generated.
  wallpaper = null;

  overrides = {};
}
```

All 16 base16 colors are required. Values are hex strings **without** a leading `#`.

A derived theme only needs to specify what it overrides plus a `parent`:

```nix
{
  parent = "builtin:base/<parent-name>";

  fonts.monospace = {
    name    = "Iosevka";
    package = "iosevka";
  };
}
```

### 4. Write `meta.nix`

```nix
{
  author      = "Original author name";
  description = "One-line description of the theme";
  tags        = [ "dark" "your-theme-name" "style-keywords" ];
  preview     = null; # or a path to a screenshot
}
```

### 5. Verify your palette

Make sure the base16 slot assignments follow the standard semantic meaning:

| Slot | Typical use |
|------|-------------|
| base00 | Default background |
| base01 | Lighter background (status bars, line numbers) |
| base02 | Selection background |
| base03 | Comments, invisibles |
| base04 | Dark foreground (status bars) |
| base05 | Default foreground, caret |
| base06 | Light foreground |
| base07 | Light background (rare) |
| base08 | Variables, XML tags, markup link text — red |
| base09 | Integers, booleans, constants — orange |
| base0A | Classes, bold, search highlight — yellow |
| base0B | Strings, inherited class, markup code — green |
| base0C | Support, regex, escape chars — cyan |
| base0D | Functions, methods, attribute IDs — blue |
| base0E | Keywords, storage, selector — purple/violet |
| base0F | Deprecated, opening/closing tags — brown/red |

Reference: [https://github.com/chriskempson/base16](https://github.com/chriskempson/base16)

### 6. Font packages

The `package` field in `fonts.*` is a nixpkgs attribute path string. Dot-separated paths are supported for nested packages:

```nix
package = "inter";                      # pkgs.inter
package = "nerd-fonts.jetbrains-mono";  # pkgs.nerd-fonts.jetbrains-mono
```

Check [search.nixos.org](https://search.nixos.org/packages) to confirm the package name before submitting.

## Submitting changes

1. Fork the repository and create a branch from `main`
2. Make your changes following the guidelines above
3. Open a pull request with a clear title and description
4. The CI workflow (`check.yml`) will run `nix flake check` and verify all exports — ensure it passes

## Code style

- Nix files use 2-space indentation
- Align `=` signs in attrsets where it aids readability
- Comment only where the intent is non-obvious
- No trailing whitespace

## Questions

Open a GitHub issue for questions, bug reports, or feature proposals.
