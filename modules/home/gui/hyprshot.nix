{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprshot.enable = lib.mkEnableOption "Enables hyprshot, a screenshot utility for wayland";
  };

  config = lib.mkIf config.hyprshot.enable {
    #TODO:: ENable once it is included in an stable release
    #programs.hyprshot = {
    #  enable = true;
    #};
  };
}
