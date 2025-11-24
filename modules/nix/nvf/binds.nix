{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.binds = {
      # Shows all the posible combinations of commands when you touch a key
      whichKey.enable = true;
      # Soy re imbecil para acodarme cosas. Por eso, Cheathsheet me deja buscar cosas como comandos, nerd icons, box drawing characters,
      # se abre con <leader> + ?
      cheatsheet.enable = true;
    };

    # --- Keybindings

    programs.nvf.settings.vim.keymaps = [
      {
        key = "<leader>?";
        mode = "n";
        action = "<Cmd>Cheatsheet<CR>";
        desc = "Cheatsheet";
      }
      # Window navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        desc = "Move to left window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        desc = "Move to bottom window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        desc = "Move to top window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        desc = "Move to right window";
      }
      # --- Unmapping of default binds
      # Unmap the default <C-w>h/j/k/l>
      {
        mode = "n";
        key = "<C-w>h";
        action = "<Nop>";
        desc = "Disable default C-w h";
      }
      {
        mode = "n";
        key = "<C-w>j";
        action = "<Nop>";
        desc = "Disable default C-w j";
      }
      {
        mode = "n";
        key = "<C-w>k";
        action = "<Nop>";
        desc = "Disable default C-w k";
      }
      {
        mode = "n";
        key = "<C-w>l";
        action = "<Nop>";
        desc = "Disable default C-w l";
      }
    ];

    # --- Moving around
  };
}
