{
  config,
  pkgs,
  inputs,
  ...
}: {
  networking = {
    # Enable networking
    networkmanager.enable = true;
    hostName = "desktop"; # Define your hostname.
    #wireless.enable = true; # Enables wireless support via wpa_supplicant.
    firewall.allowedTCPPorts = [22];
  };
}
