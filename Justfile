

deploy:
	nixos-rebuild switch --flake .#desktop --sudo


debug:
	nixos-rebuild switch --flake . --sudo --show-trace --verbose

update:
	nix flake update


