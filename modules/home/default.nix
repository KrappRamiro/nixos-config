{...}: {
  imports = [
    ./cli/docker.nix
    ./cli/git.nix
    ./cli/k8s.nix
    ./cli/monitoring.nix
    ./cli/networking.nix
    ./cli/systools.nix
    ./cli/tealdeer.nix
    ./cli/useful.nix
    ./cli/zsh.nix
    ./cli/rust.nix
    ./gui/alacritty.nix
    ./gui/firefox.nix
    ./gui/hyprland.nix
    ./gui/screenshotin.nix
    ./gui/rofi-launcher.nix
    ./gui/sioyek.nix
  ];
}
