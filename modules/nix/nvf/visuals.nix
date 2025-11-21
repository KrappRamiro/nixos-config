{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      # Highlight words and lines on the cursor for Neovim
      nvim-cursorline.enable = true;
      # Smooth scrolling for any command
      # TODO: configure
      cinnamon-nvim.enable = true;

      # Extensible UI for Neovim notifications and LSP progress messages. in the corner of the UI
      #TODO: configure
      fidget-nvim.enable = true;

      # Highlight changed text after any action not in insert mode which modifies the current buffer
      highlight-undo.enable = true;

      # adds indentation guides to Neovim
      indent-blankline.enable = true;

      # Fun; to use, run :CellularAutomaton
      cellular-automaton.enable = true;
    };
  };
}
