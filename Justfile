
host := `cat .machine-name`

deploy:
    NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake .#{{host}} --sudo --impure

debug:
    NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake .#{{host}} --sudo --show-trace --verbose

update:
    NIXPKGS_ALLOW_UNFREE=1 nix flake update


