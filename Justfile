

deploy:
	nixos-rebuild switch --flake .#desktop --use-remote-sudo


debug:
	nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

update:
	nix flake update


