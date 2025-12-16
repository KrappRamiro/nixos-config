{
  lib,
  config,
  pkgs,
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
        css.enable = true;
        html.enable = true;
        # FIXME: Enable SQL once i fix it
        sql.enable = false;
        ts.enable = true;
        lua.enable = true;
        python.enable = true;
        typst.enable = true;
        yaml.enable = true;
        bash.enable = true;
        rust = {
          enable = true;
          # This fixes the issue:
          # "The version of the proc-macro server in your Rust toolchain is newer than the version supported by your rust-analyzer"
          lsp.package = pkgs.rust-bin.stable.latest.rust-analyzer;
          extensions.crates-nvim.enable = true;
        };

        astro.enable = true;
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
          pattern = ["*"]; # Global rule
          callback = lib.generators.mkLuaInline ''
            function()
              vim.opt_local.shiftwidth = 4
              vim.opt_local.tabstop = 4
              vim.opt_local.expandtab = true
            end
          '';
          desc = "Global default indentation (4 spaces)";
          group = "indentation";
        }
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
        {
          enable = true;
          event = ["FileType"];
          pattern = [
            "yaml"
          ];
          callback = lib.generators.mkLuaInline ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.expandtab = true
            end
          '';
          desc = "Set YAML indent to 2 spaces";
          group = "indentation";
        }
        {
          enable = true;
          event = ["FileType"];
          pattern = [
            "sh"
          ];
          callback = lib.generators.mkLuaInline ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.expandtab = true
            end
          '';
          desc = "Set Shell script indent to 2 spaces";
          group = "indentation";
        }
      ];
    };
  };
}
