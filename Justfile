
host := `cat .machine-name`

deploy:
    NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake .#{{host}} --sudo --impure

debug:
    NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake .#{{host}} --sudo --show-trace --verbose

update:
    NIXPKGS_ALLOW_UNFREE=1 nix flake update

logout:
    swaymsg exit

# Battery profile: conserve battery lifespan (charge between 40-80%)
battery-longevity:
    echo "auto" | sudo tee /sys/class/power_supply/BAT0/charge_behaviour
    sudo tlp setcharge 50 80 BAT0

# Battery profile: charge to full (e.g. before a long day without outlet)
battery-full:
    echo "auto" | sudo tee /sys/class/power_supply/BAT0/charge_behaviour
    sudo tlp setcharge 1 100 BAT0

# Battery profile: run purely from AC, ignore battery entirely (preserves charge level)
battery-ac-only:
    echo "inhibit-charge" | sudo tee /sys/class/power_supply/BAT0/charge_behaviour


