{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/drivers
    ../../modules/nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes and the new Nix command-line tool
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["root" "krapp"];
  };

  environment.systemPackages = with pkgs; [wget git gcc];

  # Force apps to use Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  system.stateVersion = "25.05";

  # --- Home Manager ---
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.krapp = import ./home.nix;
  };

  programs.zsh.enable = true;
  security.polkit.enable = true;

  security.pam.loginLimits = [
    { domain = "*"; type = "soft"; item = "nofile"; value = "65536"; }
    { domain = "*"; type = "hard"; item = "nofile"; value = "65536"; }
  ];

  # Laptop power management (AMD-friendly)
  services.tlp.enable = true;

  # Hardware clock (useful if dual-booting with Windows)
  drivers.local-hardware-clock.enable = true;

  # Ryzen 5 PRO 7535U has AMD Radeon 660M (RDNA 2) integrated graphics
  drivers.amdgpu.enable = true;
  fonts.dpi = 162; # 14" 1920x1200

  nvf.enable = true;
  rust.enable = true;
  pgadmin.enable = true;
  typst.enable = true;
  doctl.enable = true;
  vlc.enable = true;
  calibre-kindle.enable = true;
}
