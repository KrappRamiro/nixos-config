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

    # Needed for ProtonVPN
    # see https://discourse.nixos.org/t/how-to-configure-and-use-proton-vpn-on-nixos/65837
    firewall.checkReversePath = false;
  };
  environment.systemPackages = with pkgs; [wireguard-tools protonvpn-gui];
}
