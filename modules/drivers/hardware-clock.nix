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
    enable = mkEnableOption "configure the RTC (also known as the hardware clock or BIOS clock) to use Coordinated Universal Time (UTC) instead of the local time zone.";
  };

  config = mkIf cfg.enable {time.hardwareClockInLocalTime = false;};
}
