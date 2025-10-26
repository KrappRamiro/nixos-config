{ pkgs, lib, config, ... }: {

  options = { rofi.enable = lib.mkEnableOption "Enables Rofi Launcher"; };

  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;

      extraConfig = {
        modi = "drun,filebrowser";
        show-icons = true;
        hover-select = true;
        terminal = "alacritty";
        kb-cancel = "Escape";
      };
    };
  };

}

