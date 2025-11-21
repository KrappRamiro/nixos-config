{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.autocomplete = {
      nvim-cmp.enable = false;
      blink-cmp.enable = true;
    };
  };
}
