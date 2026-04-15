{ lib, config, ... }: {
  options.fingerprint-scanner.enable = lib.mkEnableOption "fprintd fingerprint scanner support";

  config = lib.mkIf config.fingerprint-scanner.enable {
    services.fprintd.enable = true;

    security.pam.services = {
      login.fprintAuth = true;
      sudo.fprintAuth = true;
      polkit-1.fprintAuth = true;
    };
  };
}
