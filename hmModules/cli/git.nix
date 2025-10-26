{ pkgs, lib, config, ... }: {

  options = {
    git.enable = lib.mkEnableOption "Enables git";
    #TODO: Make git username, email, and default branch name as an option
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Ramiro Krapp";
      userEmail = "krappramiro.jpg@gmail.com";
    };
  };

}
