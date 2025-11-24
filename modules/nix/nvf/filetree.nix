{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.filetree = {
      neo-tree = {
        enable = true;
        # I stole this from https://github.com/horriblename/dots.nix/blob/master/modules/home/terminal/nvim/nvf.nix
        setupOpts = {
          window = {
            # nowait --> Neovim espera por más teclas en caso de que exista un keymap más largo. (zc, za, z whatever)
            mapping_options = {nowait = false;};
            mappings = {
              "<space>" = "none";
            };
          };
        };
      };
    };

    # --- Keybindings

    programs.nvf.settings.vim = {
      # ------------------------------------------
      # WHICH-KEY GROUPS
      # ------------------------------------------
      binds.whichKey.register = {
        "<leader>e" = "🌲 Neotree";
      };

      # The actual bindings go here
      keymaps = [
        {
          key = "<leader>ee";
          mode = "n";
          action = "<Cmd>Neotree toggle<CR>";
          desc = "File explorer";
        }

        {
          key = "<leader>eg";
          mode = "n";
          action = "<Cmd>Neotree toggle source=git_status<CR>";
          desc = "Git Status";
        }
      ];
    };
  };
}
