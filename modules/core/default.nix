{...}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./fonts.nix
    ./i18n.nix
    ./networking.nix
    ./qmk-via.nix
    ./reduce-disk-usage.nix
    ./services.nix
    ./users.nix
    ./virtualisation.nix
    ./wayland.nix
  ];
}
