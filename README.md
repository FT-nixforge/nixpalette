# nixpalette

A reusable NixOS theme framework built on top of [Stylix](https://github.com/danth/stylix).
Provides folder-based Base16 theme definitions, parent-child inheritance, and clean separation between built-in and user-defined themes.

## Highlights

- 12 built-in base themes + 4 derived themes (Catppuccin, Nord, Dracula, Gruvbox, and more)
- Parent-child theme inheritance with deep merge
- NixOS Specialisations for near-instant theme switching
- Color JSON export for live switcher integration
- Stylix integration — no manual Stylix config needed

## Quick Install

```nix
inputs.nixpalette.url = "github:FT-nixforge/nixpalette";
```

```nix
imports = [ nixpalette.nixosModules.default ];
nixpalette = {
  enable = true;
  theme  = "builtin:base/catppuccin-mocha";
};
```

## Documentation

Full documentation, options reference, theme guide, and examples:  
**[ft-nixforge.github.io/community/ft-nixpalette](https://ft-nixforge.github.io/community/ft-nixpalette)**

## License

MIT
