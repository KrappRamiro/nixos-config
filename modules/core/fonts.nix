{
  lib,
  config,
  pkgs,
  ...
}: {
  options.fonts.dpi = lib.mkOption {
    type = lib.types.nullOr lib.types.int;
    default = null;
    description = "Force a specific DPI for xserver. Null means no override (use auto-detection).";
  };

  config = {
  services.xserver.dpi = lib.mkIf (config.fonts.dpi != null) config.fonts.dpi;
  #  search fonts with
  # fc-list : family style | less
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira-code
      fira-code-symbols
      font-awesome
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      material-icons
      nerd-fonts.im-writing
      nerd-fonts.blex-mono
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-monochrome-emoji
      powerline-fonts
      roboto
      roboto-mono
      symbola
      terminus_font
    ];

    fontconfig = {
      enable = true;

      antialias = true;
      hinting = {
        enable = true;
        autohint = false; # Preferred to use the font's own hinting
        style = "slight"; # Try "slight" or "none" for your resolution
      };

      subpixel = {
        rgba = "rgb"; # Standard for most LCD/LED ultrawides
        lcdfilter = "default";
      };

      # This creates a font alias called terminal-font, which uses the FiraCode Nerd Font, and in case it needs emojis, falls back to Noto Color Emoji
      # This virtual font (again, called terminal-font) is used in your Terminal Emulator of choice (Alacritty, Kitty, Ghostty, etc...)
      # Create the terminal-font alias
      defaultFonts = {
        monospace = [
          "terminal-font"
        ];
      };

      localConf = ''
        <fontconfig>
          <alias>
            <family>terminal-font</family>
            <prefer>
              <family>FiraCode Nerd Font</family>
              <family>Noto Color Emoji</family>
            </prefer>
          </alias>
        </fontconfig>
      '';
    };
  };
  };
}
