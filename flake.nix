{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
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

    krappvim.url = "github:KrappRamiro/krappvim";

    nur.url = "github:nix-community/NUR";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nvf,
    krappvim,
    nur,
    ...
  } @ inputs: let
    stdenv.hostPlatform.system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${stdenv.hostPlatform.system};
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
            home-manager.extraSpecialArgs = {inherit inputs;}; # allows home-manager to access our flake inputs, allows me to unstall things from unstable nixpkgs

            # This ensures the system-level nixpkgs also sees the flag
            nixpkgs.config.allowUnfree = true;

            environment.systemPackages = [
              krappvim.packages.x86_64-linux.default
            ];
            nixpkgs.overlays = [
              inputs.rust-overlay.overlays.default
              inputs.nur.overlays.default
            ];
          })
        ];
      };

      thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          inputs.home-manager.nixosModules.default
          nvf.nixosModules.default
          ./hosts/thinkpad/configuration.nix

          ({pkgs, ...}: {
            home-manager.extraSpecialArgs = {inherit inputs;};
            nixpkgs.config.allowUnfree = true;

            environment.systemPackages = [
              krappvim.packages.x86_64-linux.default
            ];
            nixpkgs.overlays = [
              inputs.rust-overlay.overlays.default
              inputs.nur.overlays.default
            ];
          })
        ];
      };
    };
  };
}
