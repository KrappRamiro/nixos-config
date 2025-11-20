{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        spellcheck = {
          enable = false;
          # programmingWordlist.enable = true;
        };

        lsp = {
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
        };

        debugger = {
          #  Debug Adapter Protocol client implementation for Neovim.
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };

        # This section does not include a comprehensive list of available language modules.
        # To list all available language module options, please visit the nvf manual.
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

        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          # Highlight words and lines on the cursor for Neovim
          nvim-cursorline.enable = true;
          # Smooth scrolling for any command
          # TODO: configure
          cinnamon-nvim.enable = true;

          # Extensible UI for Neovim notifications and LSP progress messages. in the corner of the UI
          #TODO: configure
          fidget-nvim.enable = true;

          # Highlight changed text after any action not in insert mode which modifies the current buffer
          highlight-undo.enable = true;

          # adds indentation guides to Neovim
          indent-blankline.enable = true;

          # Fun; to use, run :CellularAutomaton
          cellular-automaton.enable = true;
        };

        autopairs.nvim-autopairs.enable = true;
        # The cool ass line below
        statusline = {
          lualine = {
            enable = true;
            theme = "gruvbox";
          };
        };

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
          transparent = false;
        };

        # nvf provides various autocomplete options. The tried and tested nvim-cmp
        # is enabled in default package, because it does not trigger a build. We
        # enable blink-cmp in maximal because it needs to build its rust fuzzy
        # matcher library.
        autocomplete = {
          nvim-cmp.enable = false;
          blink-cmp.enable = true;
        };

        snippets.luasnip.enable = true;

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        # The bar at the top
        tabline = {
          nvimBufferline = {
            enable = true;
            # Makes the buffers have a 1. 2. 3. etc...
            setupOpts.options.numbers = "ordinal";
          };
        };

        binds = {
          # Shows all the posible combinations of commands when you touch a key
          whichKey.enable = true;
          # Soy re imbecil para acodarme cosas. Por eso, Cheathsheet me deja buscar cosas como comandos, nerd icons, box drawing characters,
          # se abre con <leader> + ?
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false; # throws an annoying debug message
          neogit.enable = true;
        };

        # El Start screen
        dashboard = {
          alpha.enable = true;
        };

        # El notification manager
        notify = {
          nvim-notify.enable = true;
        };

        # Un project manager, se abre con Telescope projects
        projects = {
          project-nvim.enable = true;
        };

        utility = {
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

        notes = {
          obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
          # Un buen sistema de creacion de notas y ese tipo de cosas
          mind-nvim.enable = true;
          # Como better comments
          todo-comments.enable = true;
        };

        terminal = {
          # Es una terminal re copada, que la podes tener como floating, o como otro panel mas
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
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

        comments = {
          # Plugin for commenting out parts of code
          comment-nvim.enable = true;
        };

        presence = {
          neocord.enable = false;
        };
      };
    };
  };
}
