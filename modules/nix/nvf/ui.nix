{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.ui = {
      borders.enable = true;
      # Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
      noice.enable = true;
      # Colorizes colors like this: #00FF00
      colorizer.enable = true;

      # automatically highlighting other uses of the word under the cursor
      illuminate.enable = true;
      breadcrumbs = {
        enable = true;
        # navbuddy provee un navegador al estilo Ranger para los breadcrumbs
        navbuddy.enable = true;
      };
      # Muestra la columna de la derecha solamente cuando te pasas
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "150";
          ruby = "120";
          java = "130";
          go = ["90" "130"];
        };
      };

      # Provee una UI copada para los code actions
      fastaction.enable = true;
    };
  };
}
