{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvf.enable {
    programs.nvf.settings.vim.terminal = {
      # Es una terminal re copada, que la podes tener como floating, o como otro panel mas
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    programs.nvf.settings.vim = {
      # ------------------------------------------
      # WHICH-KEY GROUPS
      # ------------------------------------------
      binds.whichKey.register = {
        "<leader>t" = " Terminal";

        "<leader>tt" = " ToggleTerm";
        "<leader>tn" = " TermNew";
        "<leader>tf" = " Float";
        "<leader>tp" = "󰓫 Persistent";
        "<leader>ts" = "󱂬 Scratchpad";
      };

      keymaps = [
        # Exit terminal mode with ESC
        # <Esc> → <C-\><C-n>
        {
          mode = "t";
          key = "<Esc>";
          action = "<C-\\><C-n>";
          desc = "Exit terminal mode";
        }

        # Terminal-mode window navigation
        {
          mode = "t";
          key = "<C-h>";
          action = "<C-\\><C-n><C-w>h";
          desc = "Move left from terminal";
        }
        {
          mode = "t";
          key = "<C-j>";
          action = "<C-\\><C-n><C-w>j";
          desc = "Move down from terminal";
        }
        {
          mode = "t";
          key = "<C-k>";
          action = "<C-\\><C-n><C-w>k";
          desc = "Move up from terminal";
        }
        {
          mode = "t";
          key = "<C-l>";
          action = "<C-\\><C-n><C-w>l";
          desc = "Move right from terminal";
        }

        # ─────────────────────────────
        # ToggleTerm (horizontal / vertical)
        # ─────────────────────────────
        {
          key = "<leader>tth";
          mode = "n";
          action = "<cmd>ToggleTerm direction=horizontal size=15<CR>";
          desc = "ToggleTerm Horizontal";
        }
        {
          key = "<leader>ttv";
          mode = "n";
          action = "<cmd>ToggleTerm direction=vertical size=80<CR>";
          desc = "ToggleTerm Vertical";
        }

        # ─────────────────────────────
        # TermNew
        # ─────────────────────────────
        {
          key = "<leader>tnh";
          mode = "n";
          action = "<cmd>TermNew direction=horizontal size=12<CR>";
          desc = "TermNew Horizontal";
        }
        {
          key = "<leader>tnv";
          mode = "n";
          action = "<cmd>TermNew direction=vertical size=80<CR>";
          desc = "TermNew Vertical";
        }

        # ─────────────────────────────
        # Floating terminals
        # ─────────────────────────────
        {
          key = "<leader>tff";
          mode = "n";
          action = "<cmd>ToggleTerm direction=float<CR>";
          desc = "Toggle Floating Terminal";
        }
        {
          key = "<leader>tfn";
          mode = "n";
          action = "<cmd>TermNew direction=float<CR>";
          desc = "New Floating Terminal";
        }

        # ─────────────────────────────
        # Scratchpad terminal
        #
        # ID = 99 so it doesn’t collide with user terminals
        # ─────────────────────────────
        {
          key = "<leader>tss";
          mode = "n";
          action = "<cmd>ToggleTerm direction=float size=20 id=99 name=Scratchpad<CR>";
          desc = "Scratchpad Terminal";
        }

        # ─────────────────────────────
        # Persistent terminals by ID
        #
        # ID terminals reopen in the same buffer
        # Keep ID small so users remember <1,2,3>
        # ─────────────────────────────
        {
          key = "<leader>tp1";
          mode = "n";
          action = "<cmd>ToggleTerm direction=horizontal size=15 id=1<CR>";
          desc = "Persistent Terminal 1";
        }
        {
          key = "<leader>tp2";
          mode = "n";
          action = "<cmd>ToggleTerm direction=horizontal size=15 id=2<CR>";
          desc = "Persistent Terminal 2";
        }
        {
          key = "<leader>tp3";
          mode = "n";
          action = "<cmd>ToggleTerm direction=horizontal size=15 id=3<CR>";
          desc = "Persistent Terminal 3";
        }
      ];
    };
  };
}
