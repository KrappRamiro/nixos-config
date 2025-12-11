{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.hyprland.nixosModules.default
  ];
  # --- Wayland configuration
  # This needs to be set, there is no choice about it
  programs.hyprland = {
    enable = true;
    # NixOS 24.11 added support for launching Hyprland with Universal Wayland Session Manager (UWSM) and is the recommended way to launch Hyprland as it neatly integrates with Systemd.
    withUWSM = true; # recommended for most users
    #  set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        # Launch tuigreet, a TUI login screen
        command = "${pkgs.tuigreet}/bin/tuigreet --time --window-padding 10 --cmd 'uwsm start hyprland'";
        user = "krapp";
      };
    };
  };

  # Screensharing
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = with pkgs; [xdg-desktop-portal-hyprland];
  # };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    # This three packages are needed for screenshotin
    grim
    swappy
    slurp

    # This for monitor brightness control
    brightnessctl
    # This for controlling music with keyboard
    playerctl
  ];
}
