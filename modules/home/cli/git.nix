{
  lib,
  config,
  ...
}: {
  options = {
    git.enable = lib.mkEnableOption "Enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Ramiro Krapp";
      userEmail = "krappramiro.jpg@gmail.com";
      extraConfig = {
        # FOSS-friendly settings
        push.default = "simple"; # Match modern push behavior
        credential.helper = "cache --timeout=7200";
        init.defaultBranch = "main"; # Set default new branches to 'main'
        log.decorate = "full"; # Show branch/tag info in git log
        log.date = "iso"; # ISO 8601 date format
        # Conflict resolution style for readable diffs
        merge.conflictStyle = "diff3";
        push.autoSetupRemote = "true";
      };
      # Optional: FOSS-friendly Git aliases
      aliases = {
        br = "branch --sort=-committerdate";
        co = "checkout";
        df = "diff";
        lg = "log --graph --pretty=format:'%Cred%h%Creset - %C(yellow)%d%Creset %s %C(green)(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit";
        st = "status";
      };
    };
  };
}
