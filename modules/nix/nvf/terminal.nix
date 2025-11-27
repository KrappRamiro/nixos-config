{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.terminal = {
      # Es una terminal re copada, que la podes tener como floating, o como otro panel mas
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    programs.nvf.settings.vim.keymaps = [
      # Exit terminal mode with ESC
      # <Esc> → <C-\><C-n>
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        desc = "Exit terminal mode";
      }

      # Terminal-mode window navigation
      {
        mode = "t";
        key = "<C-h>";
        action = "<C-\\><C-n><C-w>h";
        desc = "Move left from terminal";
      }
      {
        mode = "t";
        key = "<C-j>";
        action = "<C-\\><C-n><C-w>j";
        desc = "Move down from terminal";
      }
      {
        mode = "t";
        key = "<C-k>";
        action = "<C-\\><C-n><C-w>k";
        desc = "Move up from terminal";
      }
      {
        mode = "t";
        key = "<C-l>";
        action = "<C-\\><C-n><C-w>l";
        desc = "Move right from terminal";
      }
    ];
  };
}
