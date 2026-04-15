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
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "65536";
    }
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "65536";
    }
  ];

  # ThinkPad special keys (volume, brightness, mic mute)
  boot.kernelModules = ["thinkpad_acpi"];

  # Allow the video group to write to the mic mute LED sysfs (for keybinding sync)
  services.udev.extraRules = ''
    SUBSYSTEM=="leds", KERNEL=="platform::micmute", ACTION=="add", \
      RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/leds/platform::micmute/brightness", \
      RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/leds/platform::micmute/brightness"
  '';

  # Laptop power management (AMD-friendly)
  # Battery thresholds keep charge between 40-80% to extend battery lifespan.
  # CHARGE_BEHAVIOUR resets to "auto" on boot in case "inhibit-charge" was set manually
  # via `just battery-ac-only` (which persists across reboots on this ThinkPad).
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 30;

      START_CHARGE_THRESH_BAT0 = 50;
      STOP_CHARGE_THRESH_BAT0 = 80;
      CHARGE_BEHAVIOUR_BAT0 = "auto";
    };
  };

  # Hardware clock (useful if dual-booting with Windows)
  drivers.local-hardware-clock.enable = true;

  # Ryzen 5 PRO 7535U has AMD Radeon 660M (RDNA 2) integrated graphics
  drivers.amdgpu.enable = true;
  fonts.dpi = 162; # 14" 1920x1200

  programs.steam.enable = true;
  programs.steam.remotePlay.openFirewall = true;
  programs.gamemode.enable = true;

  nvf.enable = true;
  rust.enable = true;
  pgadmin.enable = true;
  typst.enable = true;
  doctl.enable = true;
  vlc.enable = true;
  calibre-kindle.enable = true;
}
