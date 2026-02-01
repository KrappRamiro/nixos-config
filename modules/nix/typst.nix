{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    typst.enable =
      lib.mkEnableOption
      "Enables typst, an alternative to Latex, but easier";
  };

  config = lib.mkIf config.typst.enable {
    environment.systemPackages = [
      pkgs.typst
    ];
  };
}
