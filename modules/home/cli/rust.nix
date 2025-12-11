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
    home.packages = with pkgs; [
      rustup
      # Linkers
      clang
      lld
    ];

    home.sessionVariables = {
      CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER = "${pkgs.clang}/bin/clang";
      RUSTFLAGS = "-C link-arg=-fuse-ld=lld";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
  };
}
