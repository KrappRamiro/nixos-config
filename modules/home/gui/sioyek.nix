{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    sioyek.enable = lib.mkEnableOption "Enables sioyek, a pdf reader";
  };

  config = lib.mkIf config.sioyek.enable {
    programs.sioyek = {
      enable = true;

      # We want the development branch of sioyek, it has the newest features
      package = pkgs.sioyek.overrideAttrs (oldAttrs: {
        pname = "sioyek-dev";
        version = "dev-2026-02-01";

        src = pkgs.fetchFromGitHub {
          owner = "ahrm";
          repo = "sioyek";
          rev = "development";
          hash = "sha256-hlMTBlJK6bkiRJS+NtXtZMolX3R0S/XE5dg2uwwDLBQ=";
        };
      });

      bindings = {
        "screen_down" = ["<C-d>"];
        "screen_up" = ["<C-u>"];
      };

      config = {
        "add_newlines_when_copying_text" = "1";
      };
    };
  };
}
