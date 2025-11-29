{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # --- NEOVIM WITH NVF
    # Required, nvf works best and only directly supports flakes
    nvf = {
      url = "github:NotAShelf/nvf";
      # You can override the input nixpkgs to follow your system's
      # instance of nixpkgs. This is safe to do as nvf does not depend
      # on a binary cache.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # See https://github.com/NotAShelf/nvf/discussions/1250
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf,
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
          nvf.nixosModules.default
          ./hosts/desktop/configuration.nix

          # This applies the overlay to the system instance of pkgs
          ({pkgs, ...}: {
            nixpkgs.overlays = [inputs.rust-overlay.overlays.default];
          })
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
