{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;
      markdown.format.type = "prettierd";
      css.enable = true;
      css.format.type = "prettierd";
      html.enable = true;
      sql.enable = true;
      ts.enable = true;
      ts.format.type = "prettierd";
      lua.enable = true;
      python.enable = true;
      typst.enable = true;
      rust = {
        enable = true;
        crates.enable = true;
      };

      astro.enable = true;
      astro.format.type = "prettierd";
    };
  };
}
