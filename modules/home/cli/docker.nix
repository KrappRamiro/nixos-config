{
  lib,
  config,
  ...
}: {
  options = {
    docker.enable = lib.mkEnableOption "Enables docker";
  };

  config = lib.mkIf config.docker.enable {
    programs.docker-cli = {
      enable = true;
    };
  };
}
