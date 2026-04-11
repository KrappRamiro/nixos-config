{
  lib,
  config,
  ...
}: {
  options = {
    ghostty.enable =
      lib.mkEnableOption "Enables ghostty, a terminal emulator";
  };

  config = lib.mkIf config.ghostty.enable {
    programs.ghostty = {
      enable = true;
      # After deploying changes, reload the config in a running Ghostty window with Ctrl+Shift+,
      settings = {
        font-family = "terminal-font";
        font-size = 14;
        mouse-scroll-multiplier = 5;
        theme = "Gruvbox Dark Hard";
      };
    };
  };
}
