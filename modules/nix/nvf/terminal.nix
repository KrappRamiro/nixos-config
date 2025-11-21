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
  };
}
