{...}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./fonts.nix
    ./i18n.nix
    ./networking.nix
    ./oom.nix
    ./qmk-via.nix
    ./reduce-disk-usage.nix
    ./services.nix
    ./unfree-firmware.nix
    ./users.nix
    ./virtualisation.nix
    ./wayland.nix
  ];
}
