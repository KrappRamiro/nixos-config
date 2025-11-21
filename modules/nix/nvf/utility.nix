{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.utility = {
      # CCC es un Color Picker
      ccc.enable = true;

      # Provee un diff view bastante copado
      diffview-nvim.enable = true;
      # Mejora la funcion de yank, capaz algun dia lo checkeo
      yanky-nvim.enable = false;

      # Permite elegir iconos
      icon-picker.enable = true;

      # Para hacer surround,
      # TODO: Falta configurarlo
      surround.enable = true;

      # Solve leetcode inside neovim
      leetcode-nvim.enable = true;
      # Soporte para multicursor
      multicursors.enable = true;

      # TODO: Tiene pinta de ser algo genial, pero no me da la cabeza para entenderlo
      smart-splits.enable = false;

      # Diff previewer window shows the difference between the current node and the node under the cursor.
      undotree.enable = true;

      # in-editor annotations usually at the end of a closing tag/bracket/parenthesis/etc.
      #They help you get the context of the end of that AST node so you don't have to navigate to find it.
      nvim-biscuits.enable = true;

      motion = {
        # Te permite saltar a cualquier lado del buffer de forma rapidisima
        hop.enable = true;
        # Lo que te muestra los movements abajo de la linea actual
        precognition.enable = true;
      };
      images = {
        # In order to use this, i would need to use kitty terminal
        image-nvim.enable = false;
        # Embed images into documents, either by copypasting, by drag and dropping, by selecting files, etc...
        img-clip.enable = true;
      };
    };
  };
}
