{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    mako.enable = lib.mkEnableOption "Enables Mako, notifications service";
  };

  config = lib.mkIf config.mako.enable {
    services.mako = {
      enable = true;
    };
    # Install libnotify to send test commands
    home.packages = [pkgs.libnotify];
  };
}
