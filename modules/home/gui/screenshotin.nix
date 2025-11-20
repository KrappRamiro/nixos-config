{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    screenshotin.enable = lib.mkEnableOption "Enables screenshotin, a custom screenshot tool";
  };

  config = lib.mkIf config.screenshotin.enable {
    # The grim, swappy and slurp system packages should be installed like this in your configuration.nix
    #environment.systemPackages = with pkgs; [
    #  # Dependencies of the shell scripts
    #  grim
    #  swappy
    #  slurp
    #];

    # Now this depends on this shell script
    home.packages = [
      (pkgs.writeShellScriptBin "screenshotin" ''
        grim -g "$(slurp)" - | swappy -f -
      '')
    ];

    home.file = {
      ".config/swappy/config".text = ''
        [Default]
        save_dir=/home/krapp/Pictures/Screenshots
        save_filename_format=swappy-%Y%m%d-%H%M%S.png
        show_panel=false
        line_size=5
        text_size=20
        text_font=Ubuntu
        paint_mode=brush
        early_exit=true
        fill_shape=false
      '';
    };
  };
}
