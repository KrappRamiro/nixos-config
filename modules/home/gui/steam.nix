{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    steam.enable = lib.mkEnableOption "Enables Steam game client";
  };

  config = lib.mkIf config.steam.enable {
    programs.mangohud = {
      enable = true;
      package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mangohud;
    };

    home.packages = [
      pkgs.steam
      pkgs.protonup-qt
      # gamescope — Valve's nested Wayland compositor for games.
      # Useful on Sway (tiling WM) and for FSR upscaling to save battery.
      # Set per-game in Steam launch options, not globally.
      #
      # HOW TO USE:
      #   Basic (fixes fullscreen/tiling issues):
      #     gamescope -f -- %command%
      #
      #   Force resolution + fullscreen:
      #     gamescope -W 1920 -H 1200 -f -- %command%
      #
      #   FSR upscaling (render at lower res, upscale to native — good for battery):
      #     gamescope -W 1920 -H 1200 -w 1280 -h 720 --fsr-upscaling -f -- %command%
      #
      #   Cap frame rate (battery/heat savings):
      #     gamescope -r 30 -f -- %command%
      #
      #   Combined (FSR + frame cap + MangoHud overlay):
      #     gamescope -W 1920 -H 1200 -w 1280 -h 720 --fsr-upscaling -r 30 -f -- mangohud %command%
      pkgs.gamescope
    ];
  };
}
