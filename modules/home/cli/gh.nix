{ lib, config, ... }: {
  options = {
    gh.enable = lib.mkEnableOption "Enables GitHub CLI (gh)";
  };

  config = lib.mkIf config.gh.enable {
    programs.gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        hosts = {
          "github.com" = {
            git_protocol = "ssh";
          };
        };
      };
    };
  };
}
