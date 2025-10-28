{ pkgs, lib, config, ... }: {

  options = {
    firefox.enable = lib.mkEnableOption "Enables Firefox, my web browser";
  };

  config =
    lib.mkIf config.firefox.enable { programs.firefox = { enable = true; }; };

}
