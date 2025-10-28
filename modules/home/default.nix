{...}: {
  imports = [
    ./cli/git.nix
    ./cli/k8s.nix
    ./cli/monitoring.nix
    ./cli/networking.nix
    ./cli/systools.nix
    ./cli/tealdeer.nix
    ./cli/useful.nix
    ./cli/zsh.nix
    ./gui/alacritty.nix
    ./gui/firefox.nix
    ./gui/hyprland.nix
    ./gui/hyprshot.nix
    ./gui/rofi-launcher.nix
  ];
}
