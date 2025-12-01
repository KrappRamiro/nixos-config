{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.lsp = {
      # This must be enabled for the language modules to hook into
      # the LSP API.
      enable = true;
      formatOnSave = true;
      # lspkind le agrega iconitos a la parte de UI de completion
      lspkind.enable = false;
      # cuando haya una codeAction disponible, una lamparita aparece en la linea
      lightbulb.enable = true;
      # Improves the Neovim built-in LSP experience.
      lspsaga.enable = false;
      # Shows diagnostics, referencces, telescope results, quickfix and location lists in a pretty list
      trouble.enable = true;
      # Show function signature when you type
      lspSignature.enable = false; # conflicts with blink in maximal
      # Otter.nvim provides lsp features, including code completion, for code embedded in other documents
      otter-nvim.enable = true;
      # Te permite ver la docu de una funcion en un side panel
      nvim-docs-view.enable = true;

      #
      # -------------------------------------------------
      #   DOCKER COMPOSE SUPPORT (yaml-language-server)
      # -------------------------------------------------
      # No instalamos compose-language-service.
      # Usamos yamlls + el esquema oficial del compose-spec.
      #
      servers = {
        yamlls = {
          enable = true;
          settings = {
            yaml = {
              validate = true;
              format.enable = true;
              # Agregamos el esquema OFICIAL del compose-spec:
              # https://github.com/compose-spec/compose-spec/blob/master/schema/compose-spec.json
              schemas = {
                "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = [
                  "docker-compose.yml"
                  "docker-compose.yaml"
                  "compose.yml"
                  "compose.yaml"
                ];
              };
            };
          };
        };
      };
    };
  };
}
