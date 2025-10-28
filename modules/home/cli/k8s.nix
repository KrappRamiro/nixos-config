{ pkgs, lib, config, ... }: {

  options = { k8s.enable = lib.mkEnableOption "Enables Kubernetes programs"; };

  config = lib.mkIf config.k8s.enable {

    # There are no HomeManager modules for the following packages, so we are installing them this way:
    home.packages = with pkgs; [ kubectl ];
  };
}
