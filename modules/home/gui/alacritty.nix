{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    alacritty.enable =
      lib.mkEnableOption "Enables alacritty, a terminal emulator";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
          size = 14;
          # Please see modules/core/fonts.nix to understand where terminal-font is coming from
          normal.family = "terminal-font";
          bold.family = "terminal-font";
          italic.family = "terminal-font";
          bold_italic.family = "terminal-font";
        };
        scrolling.multiplier = 5;
        selection.save_to_clipboard = false;
      };
    };
  };
}
