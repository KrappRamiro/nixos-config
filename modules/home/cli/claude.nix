{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    claude.enable = lib.mkEnableOption "Enables claude";
  };

  config = lib.mkIf config.claude.enable {
    home.packages = with pkgs; [
      # ... other packages
      claude-code
    ];
  };
}
