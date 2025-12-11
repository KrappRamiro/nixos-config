{pkgs, ...}: {
  #FIXME: Enable this once i get more info on https://github.com/NotAShelf/nvf/issues/920
  #  programs.nvf.settings.vim = {
  #    extraPackages = with pkgs; [
  #      sqlfluff
  #      sqls
  #    ];
  #
  #    luaConfigRC.sqlconfig =
  #      # lua
  #      ''
  #        -- FIX: Remove after this is fixed: https://github.com/NotAShelf/nvf/issues/920#issuecomment-2974522465
  #           require("lspconfig").sqls.setup({
  #             on_attach = function(client, bufnr)
  #               require('sqls').on_attach(client, bufnr)
  #             end,
  #             cmd = { "${pkgs.sqls}/bin/sqls", "-config", string.format("%s/config.yml", vim.fn.getcwd()) }
  #           })
  #      '';
  #  };
}
