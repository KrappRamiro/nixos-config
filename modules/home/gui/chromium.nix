{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    chromium.enable = lib.mkEnableOption "Enables Chrome web browser";
  };

  config =
    lib.mkIf config.chromium.enable {programs.chromium = {enable = true;};};
}
