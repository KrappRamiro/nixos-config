{...}: {
  virtualisation.docker = {
    # Disables the system wide Docker daemon, needed for rootless docker
    enable = false;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
