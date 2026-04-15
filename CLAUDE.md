# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Build and switch (primary workflow)
just deploy    # nixos-rebuild switch --flake .#desktop --sudo --impure

# Build with verbose output for debugging
just debug

# Update all flake inputs
just update
```

The `--impure` flag is intentional — it exists because home-manager won't install unfree software otherwise.

## Architecture

This is a NixOS flake config for a single host (`desktop`, user `krapp`). There is one active system configuration; the `thinkpad` host is commented out.

**Flake inputs:** `nixpkgs` (25.11 stable), `nixpkgs-unstable`, `home-manager` (release-25.11), `nvf` (Neovim config framework), `rust-overlay`, and a local `krappvim` flake at `/home/krapp/dev/krappvim`.

### Module hierarchy

```
hosts/desktop/
  configuration.nix   # System entrypoint — imports core, drivers, nix modules; enables home-manager
  home.nix            # Home Manager entrypoint — enables/disables all home modules via options

modules/
  core/               # NixOS system config (audio, boot, fonts, networking, users, wayland…)
  drivers/            # AMD GPU, hardware clock
  nix/                # System-level programs: nvf (Neovim), rust, pgadmin, typst, doctl, vlc
  nix/nvf/            # nvf Neovim config broken into sub-files (lsp, languages, binds, etc.)
  home/               # Home Manager modules, all imported via home/default.nix
    cli/              # CLI tools (git, zsh, docker, k8s, aws-cli, claude, direnv, rust…)
    gui/              # GUI apps (hyprland, alacritty, firefox, chromium, rofi, mako…)
```

### Module pattern

Every home module follows the same pattern — define an option, gate config behind it:

```nix
{ lib, config, pkgs, ... }: {
  options.mymodule.enable = lib.mkEnableOption "...";
  config = lib.mkIf config.mymodule.enable {
    # home-manager config here
  };
}
```

Modules are toggled in `hosts/desktop/home.nix` (e.g. `claude.enable = true`). All home modules are imported unconditionally in `modules/home/default.nix`; the enable flags control whether they activate.

### nvf (Neovim) special case

The nvf Neovim config lives in `modules/nix/` (not `modules/home/`) because it couldn't be made to work with Home Manager. It is a NixOS-level module enabled via `nvf.enable = true` in `configuration.nix`.

### Accessing nixpkgs-unstable

Use `inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.packageName` — see `modules/home/cli/useful.nix` for a working example (devenv is pulled from unstable this way).
