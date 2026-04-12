

deploy:
    NIXPKGS_ALLOW_UNFREE=1  nixos-rebuild switch --flake .#desktop --sudo --impure

deploy-thinkpad:
    NIXPKGS_ALLOW_UNFREE=1  nixos-rebuild switch --flake .#thinkpad --sudo --impure
    #TODO: I should not use impure, fuck it, fixing another day. Its because home-manager wont install unfree software


debug:
	NIXPKGS_ALLOW_UNFREE=1  nixos-rebuild switch --flake . --sudo --show-trace --verbose

update:
	NIXPKGS_ALLOW_UNFREE=1  nix flake update


