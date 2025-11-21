{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.notes = {
      obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
      # Un buen sistema de creacion de notas y ese tipo de cosas
      mind-nvim.enable = true;
      # Como better comments
      todo-comments.enable = true;
    };
  };
}
