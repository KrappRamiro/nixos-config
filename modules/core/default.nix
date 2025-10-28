{...}: {
  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./fonts.nix
    ./i18n.nix
    ./networking.nix
    ./reduce-disk-usage.nix
    ./services.nix
    ./users.nix
    ./wayland.nix
  ];
}
