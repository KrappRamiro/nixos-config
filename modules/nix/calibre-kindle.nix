{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    calibre-kindle.enable = lib.mkEnableOption "Enables Calibre e-book manager with Kindle/USB and CBR/CBZ support";
  };

  config = lib.mkIf config.calibre-kindle.enable {
    # Required for USB device connectivity (e.g. Kindle)
    services.udisks2.enable = true;

    environment.systemPackages = [
      (pkgs.calibre.override {
        unrarSupport = true;
      })
    ];
  };
}
