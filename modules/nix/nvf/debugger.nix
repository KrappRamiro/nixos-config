{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.debugger = {
      #  Debug Adapter Protocol client implementation for Neovim.
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };
  };
}
