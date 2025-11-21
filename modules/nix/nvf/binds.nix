{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.binds = {
      # Shows all the posible combinations of commands when you touch a key
      whichKey.enable = true;
      # Soy re imbecil para acodarme cosas. Por eso, Cheathsheet me deja buscar cosas como comandos, nerd icons, box drawing characters,
      # se abre con <leader> + ?
      cheatsheet.enable = true;
    };
  };
}
