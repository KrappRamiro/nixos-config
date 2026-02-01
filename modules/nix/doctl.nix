{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    doctl.enable =
      lib.mkEnableOption
      "Enables doctl, the Digital Ocean CLI";
  };

  config = lib.mkIf config.doctl.enable {
    environment.systemPackages = [
      pkgs.doctl
    ];
  };
}
