{ lib, config, pkgs, inputs, ... }: {
  options.npm.enable = lib.mkEnableOption "npm";

  config = lib.mkIf config.npm.enable {
    home.packages = [
      inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nodejs
    ];

    home.file.".npmrc".text = ''
      prefix=''${HOME}/mutable_node_modules
    '';

    home.sessionPath = [ "$HOME/mutable_node_modules/bin" ];

    home.activation.createMutableNodeModules = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p "$HOME/mutable_node_modules"
    '';
  };
}
