{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    rust.enable =
      lib.mkEnableOption
      "Enables rust";
  };

  # Remember to run
  # rustup component add llvm-tools-preview
  # rustup component add rustfmt
  # rustup component add clippy
  config = lib.mkIf config.rust.enable {
    environment.systemPackages = with pkgs; [sqlx-cli pkg-config openssl];
  };
}
