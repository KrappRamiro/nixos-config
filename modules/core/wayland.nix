{
  config,
  pkgs,
  inputs,
  ...
}: {
  # --- Wayland configuration
  # This needs to be set, there is no choice about it
  programs.hyprland = {
    enable = true;
    #  set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # Display Manager settings
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
