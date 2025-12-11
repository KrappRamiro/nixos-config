{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {rofi.enable = lib.mkEnableOption "Enables Rofi Launcher";};

  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi;

      extraConfig = {
        modi = "drun,filebrowser";
        show-icons = true;
        hover-select = true;
        terminal = "alacritty";
        kb-cancel = "Escape";

        icon-theme = "Papirus";
        font = "JetBrainsMono Nerd Font Mono 12";
        drun-display-format = "{icon} {name}";
        display-drun = " Apps";
        display-run = " Run";
        display-filebrowser = " File";
      };
    };
  };
}
