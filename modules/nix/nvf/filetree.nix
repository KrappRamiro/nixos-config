{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.filetree = {
      neo-tree = {
        enable = true;
      };
    };

    # --- Keybindings

    programs.nvf.settings.vim.keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        action = "<Cmd>Neotree toggle<CR>";
        desc = "opens the file explorer";
      }
    ];
  };
}
