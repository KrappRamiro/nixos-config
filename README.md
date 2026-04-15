# nixos-config

## Setup

Clone the repo, then symlink `/etc/nixos` to it so NixOS uses it as the live
configuration:

```bash
sudo ln -sf /home/krapp/nixos-config /etc/nixos
```

Then create a `.machine-name` file with the name of the host
you're configuring (must match a `nixosConfigurations` key in `flake.nix`):

```bash
echo "desktop" > .machine-name   # or "thinkpad", "new-machine-name", etc.
```

This file is gitignored, each machine has its own.

For the any new machine), also generate the hardware config and replace the
placeholder:

```bash
nixos-generate-config --show-hardware-config > hosts/new-machine-name/hardware-configuration.nix
```

## Usage

```bash
just deploy   # build and switch to current machine's config
just debug    # same with --show-trace --verbose
just update   # update all flake inputs
```
