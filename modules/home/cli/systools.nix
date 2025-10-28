{ pkgs, lib, config, ... }: {

  options = { systools.enable = lib.mkEnableOption "Enables system tools"; };

  config = lib.mkIf config.systools.enable {
    # There are no HomeManager modules for the following packages, so we are installing them this way:
    home.packages = with pkgs; [
      # it provides the command nom, works just like nix, but with more detailed log output
      nix-output-monitor

      # system tools
      lsof # lists open files
      sysstat
      lm_sensors
      ethtool
      pciutils # lspci
      usbutils # lsusb
    ];
  };
}
