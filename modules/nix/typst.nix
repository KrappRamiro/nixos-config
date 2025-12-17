{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    typst.enable =
      lib.mkEnableOption
      "Enables typst";
  };

  config = lib.mkIf config.typst.enable {
    environment.systemPackages = [
      pkgs.typst
    ];
  };
}
