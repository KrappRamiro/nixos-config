{ pkgs, lib, config, ... }: {

  options = {
    monitoring.enable =
      lib.mkEnableOption "Enables system monitoring tools like btop";
  };

  config = lib.mkIf config.monitoring.enable {
    # There are no HomeManager modules for the following packages, so we are installing them this way:
    home.packages = with pkgs; [
      # monitoring
      btop # resource
      iotop # IO
      iftop # network
      strace # system calls
      ltrace # library calls
    ];
  };

}
