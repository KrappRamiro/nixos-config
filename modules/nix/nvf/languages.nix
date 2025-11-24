{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim = {
      languages = {
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

      augroups = [
        # Holds the autocmds that configure the indentation when an event of FileType happens
        {
          enable = true;
          name = "indentation";
        }
      ];
      autocmds = [
        {
          enable = true;
          event = ["FileType"];
          pattern = ["python"];
          callback = lib.generators.mkLuaInline ''
            function()
              vim.opt_local.shiftwidth = 4
              vim.opt_local.tabstop = 4
              vim.opt_local.expandtab = true
            end
          '';
          desc = "Set Python indent to 4 spaces";
          group = "indentation";
        }
        {
          enable = true;
          event = ["FileType"];
          pattern = [
            "javascript"
            "typescript"
          ];
          callback = lib.generators.mkLuaInline ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.expandtab = true
            end
          '';
          desc = "Set JS/TS indent to 2 spaces";
          group = "indentation";
        }
        {
          enable = true;
          event = ["FileType"];
          pattern = [
            "nix"
          ];
          callback = lib.generators.mkLuaInline ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.expandtab = true
            end
          '';
          desc = "Set NixOS indent to 2 spaces";
          group = "indentation";
        }
      ];
    };
  };
}
