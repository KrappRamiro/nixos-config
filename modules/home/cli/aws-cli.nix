{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    awscli.enable = lib.mkEnableOption "Enables the AWS CLI";
  };

  config = lib.mkIf config.awscli.enable {
    programs.awscli = {
      enable = true;
      # I need a version that has `aws login`
      package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.awscli2;
      # You can still use the module's other features
      settings = {
        default = {
          region = "us-east-1";
          output = "json";
        };
      };
    };

    home.sessionVariables = {
      AWS_CONFIG_FILE = "${config.home.homeDirectory}/.aws/file-used-to-stop-aws-login-to-complain-about-a-read-only-filesystem";
    };
  };
}
