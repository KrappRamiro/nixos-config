{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim = {
      tabline = {
        nvimBufferline = {
          enable = true;
          # Makes the buffers have a 1. 2. 3. etc...
          setupOpts.options.numbers = "ordinal";
        };
      };
      keymaps = [
        {
          mode = "n";
          key = "<C-1>";
          action = "<Cmd>BufferLineGoToBuffer 1<CR>";
          desc = "Go to buffer 1";
        }
        {
          mode = "n";
          key = "<C-2>";
          action = "<Cmd>BufferLineGoToBuffer 2<CR>";
          desc = "Go to buffer 2";
        }
        {
          mode = "n";
          key = "<C-3>";
          action = "<Cmd>BufferLineGoToBuffer 3<CR>";
          desc = "Go to buffer 3";
        }
        {
          mode = "n";
          key = "<C-4>";
          action = "<Cmd>BufferLineGoToBuffer 4<CR>";
          desc = "Go to buffer 4";
        }
        {
          mode = "n";
          key = "<C-5>";
          action = "<Cmd>BufferLineGoToBuffer 5<CR>";
          desc = "Go to buffer 5";
        }
        {
          mode = "n";
          key = "<C-6>";
          action = "<Cmd>BufferLineGoToBuffer 6<CR>";
          desc = "Go to buffer 6";
        }
        {
          mode = "n";
          key = "<C-7>";
          action = "<Cmd>BufferLineGoToBuffer 7<CR>";
          desc = "Go to buffer 7";
        }
        {
          mode = "n";
          key = "<C-8>";
          action = "<Cmd>BufferLineGoToBuffer 8<CR>";
          desc = "Go to buffer 8";
        }
        {
          mode = "n";
          key = "<C-9>";
          action = "<Cmd>BufferLineGoToBuffer 9<CR>";
          desc = "Go to buffer 9";
        }
      ];
    };
  };
}
