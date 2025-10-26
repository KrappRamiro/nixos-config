{ pkgs, lib, config, ... }: {

  options = {
    networking.enable = lib.mkEnableOption
      "Enables networking tools, like ping, dig and nslookup";
  };

  config = lib.mkIf config.networking.enable {
    # There are no HomeManager modules for the following packages, so we are installing them this way:
    home.packages = with pkgs; [
      # networking tools
      mtr # networking diagnostic tool
      iperf3
      dnsutils # dig + nslookup
      ldns # replacement of dig, it provides the command drill
      aria2 # lightweight multi-protocol & multi-source CLI download utility
    ];
  };

}
