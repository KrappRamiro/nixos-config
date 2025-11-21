{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.statusline = {
      lualine = {
        enable = true;
        theme = "gruvbox";
      };
    };
  };
}
