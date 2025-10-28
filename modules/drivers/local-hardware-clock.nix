{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.drivers.local-hardware-clock;
in {
  options.drivers.local-hardware-clock = {
    enable = mkEnableOption "Change Hardware Clock To Local Time";
  };

  config = mkIf cfg.enable {time.hardwareClockInLocalTime = true;};
}
