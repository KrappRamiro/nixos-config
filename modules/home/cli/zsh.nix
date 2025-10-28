{ pkgs, lib, config, ... }: {

  options = { zsh.enable = lib.mkEnableOption "Enables the ZSH shell"; };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
    };

    # Starship - a customizable prompt for any shell
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
    };

  };

}
