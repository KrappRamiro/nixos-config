{
  lib,
  config,
  ...
}: {
  imports = [
    ./autocomplete.nix
    ./binds.nix
    ./debugger.nix
    ./filetree.nix
    ./git.nix
    ./languages.nix
    ./lsp.nix
    ./notes.nix
    ./statusline.nix
    ./tabline.nix
    ./terminal.nix
    ./theme.nix
    ./ui.nix
    ./utility.nix
    ./visuals.nix
  ];

  options = {
    nvf.enable = lib.mkEnableOption "Enables nvf";
  };

  config = lib.mkIf config.nvf.enable {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          spellcheck = {
            enable = false;
            # programmingWordlist.enable = true;
          };

          autopairs.nvim-autopairs.enable = true;

          snippets.luasnip.enable = true;

          telescope.enable = true;

          # El Start screen
          dashboard = {
            alpha.enable = true;
          };

          # El notification manager
          notify = {
            nvim-notify.enable = true;
          };

          # Un project manager, se abre con Telescope projects
          projects = {
            project-nvim.enable = true;
          };

          comments = {
            # Plugin for commenting out parts of code
            comment-nvim.enable = true;
          };

          presence = {
            neocord.enable = false;
          };
        };
      };
    };
  };
}
