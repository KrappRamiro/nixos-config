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
  };
}
