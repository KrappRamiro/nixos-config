{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    pgadmin.enable =
      lib.mkEnableOption
      "Enables pgadmin";
  };

  config = lib.mkIf config.pgadmin.enable {
    environment.systemPackages = [
      pkgs.pgadmin4-desktopmode
    ];
  };
}
