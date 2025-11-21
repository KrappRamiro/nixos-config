{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.tabline = {
      nvimBufferline = {
        enable = true;
        # Makes the buffers have a 1. 2. 3. etc...
        setupOpts.options.numbers = "ordinal";
      };
    };
  };
}
