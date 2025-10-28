{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    tealdeer.enable =
      lib.mkEnableOption
      "Enables tealdeer, a Too Long Didnt Read implementation";
  };

  config = lib.mkIf config.tealdeer.enable {
    programs.tealdeer = {
      enable = true;
      settings = {
        display.compact = false;
        display.use_pager = true;
        updates.auto_update = true;
      };
    };
  };
}
