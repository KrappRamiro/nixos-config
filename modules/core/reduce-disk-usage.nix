{
  lib,
  config,
  ...
}: {
  options = {
    reduceDiskUsage.enable =
      lib.mkEnableOption
      "Enables the Nix Garbage Collection and Store optimizations";
  };

  config = lib.mkIf config.reduceDiskUsage.enable {
    # limit the number of generations to keep
    boot.loader.systemd-boot.configurationLimit = 10;

    # perform Garbage Collection weekly to mantain low disk usage
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };

    # optimize the store
    nix.optimise.automatic = true;
    nix.settings.auto-optimise-store = true;
  };
}
