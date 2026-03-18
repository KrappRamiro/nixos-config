{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    direnv.enable = lib.mkEnableOption "Enables direnv";
  };

  # Remember to
  # 1. Create .envrc in your project root:
  #
  # -----------------------
  #   #!/usr/bin/env bash
  #   # this is the file .envrc , it runs when you enter the folder with cd
  #   eval "$(devenv direnvrc)"
  #   use devenv
  # -----------------------
  #
  # 2. Allow it:
  #
  #   direnv allow
  #
  # 3. Add .direnv to .gitignore:
  #
  #   echo ".direnv" >> .gitignore
  #
  config = lib.mkIf config.direnv.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
