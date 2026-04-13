{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes GTK 3 app issues (file choosers, etc.)
  };

  # UWSM properly initializes graphical-session.target and the dbus/systemd
  # environment for Wayland compositors — same as Hyprland's withUWSM = true.
  programs.uwsm = {
    enable = true;
    waylandCompositors.sway = {
      prettyName = "Sway";
      comment = "Sway compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/sway";
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --window-padding 10 --cmd 'uwsm start sway-uwsm.desktop'";
        user = "krapp";
      };
    };
  };

  # Required for swaylock to authenticate via PAM
  security.pam.services.swaylock = {};

  # Screensharing via xdg-desktop-portal-wlr
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    # These three packages are needed for screenshotin
    grim
    swappy
    slurp

    # Monitor brightness control
    brightnessctl
    # Controlling music with keyboard
    playerctl
  ];
}
