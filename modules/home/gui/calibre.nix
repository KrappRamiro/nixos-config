{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    calibre.enable = lib.mkEnableOption "Enables Calibre e-book manager";
  };

  config = lib.mkIf config.calibre.enable {
    home.packages = [pkgs.calibre];
  };
}
