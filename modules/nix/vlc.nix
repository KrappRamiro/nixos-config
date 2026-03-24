{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    vlc.enable =
      lib.mkEnableOption
      "Enables VLC player";
  };

  config = lib.mkIf config.vlc.enable {
    environment.systemPackages = [
      pkgs.vlc
      pkgs.libvlc
    ];
  };
}
