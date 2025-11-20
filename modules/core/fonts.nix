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
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-monochrome-emoji
      powerline-fonts
      roboto
      roboto-mono
      symbola
      terminus_font
    ];
  };
}
