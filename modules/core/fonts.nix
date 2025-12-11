{pkgs, ...}: {
  #  search fonts with
  # fc-list : family style | less
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      fira-code
      fira-code-symbols
      font-awesome
      jetbrains-mono
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

    # This creates a font alias called terminal-font, which uses the FiraCode Nerd Font, and in case it needs emojis, falls back to Noto Color Emoji
    # This virtual font (again, called terminal-font) is used in your Terminal Emulator of choice (Alacritty, Kitty, Ghostty, etc...)
    fontconfig = {
      enable = true;

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
}
