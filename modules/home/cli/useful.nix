{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    useful.enable =
      lib.mkEnableOption
      "Enables useful programs. Yes, i can't be more lazy, they are cool AF programs that i think i want in my system";
  };

  config = lib.mkIf config.useful.enable {
    # Packages that DO have HomeManager modules go after this line
    #programs.XXXXXXX.enable = true;

    # There are no HomeManager modules for the following packages, so we are installing them this way:
    home.packages = with pkgs; [
      just
      tree
      inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.devenv # I want version 2.0 which is not yet in 25.11
      neofetch

      # archives
      zip
      unzip

      # utils
      ripgrep # recursively searches a directory for a regex pattern
      jq # parses JSON
      yq-go # yaml processor
      eza # ls replacement
      fzf # fuzzy finder

      # misc
      cowsay
      file
      which
      tree
      gnused
      gnutar
      gawk
      zstd
      gnupg

      # productivity
      glow # markdown previewer in terminal

      # provides the npins utility
      npins

      # Rust toolchain
      rustup
    ];
  };
}
