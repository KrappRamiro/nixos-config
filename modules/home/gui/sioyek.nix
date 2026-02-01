{
  lib,
  config,
  ...
}: {
  options = {
    sioyek.enable = lib.mkEnableOption "Enables sioyek, a pdf reader";
  };

  config = lib.mkIf config.sioyek.enable {
    programs.sioyek = {
      enable = true;
      bindings = {
        "screen_down" = ["<C-d>"];
        "screen_up" = ["<C-u>"];
      };
      config = {
        add_newlines_when_copying_text = "true";
      };
    };
  };
}
