{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      transparent = false;
    };
  };
}
