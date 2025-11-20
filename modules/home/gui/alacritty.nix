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
          normal.family = "FiraCode Nerd Font";
          bold.family = "FiraCode Nerd Font";
          italic.family = "FiraCode Nerd Font";
          bold_italic.family = "FiraCode Nerd Font";
        };
        scrolling.multiplier = 5;
        selection.save_to_clipboard = false;
      };
    };
  };
}
