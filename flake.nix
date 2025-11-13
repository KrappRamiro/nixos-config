{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim.url = "github:pfassina/lazyvim-nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    lazyvim,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          ./hosts/desktop/configuration.nix
        ];
      };

      # thinkpad = nixpkgs.lib.nixosSystem {
      #	specialArgs = { inherit inputs; };
      #	modules = [
      #		./hosts/thinkpad/configuration.nix
      #		./nixosModules
      #	];
      #
      #};
    };
  };
}
