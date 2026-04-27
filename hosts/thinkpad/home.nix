{pkgs, ...}: {
  home.username = "krapp";
  home.homeDirectory = "/home/krapp";
  home.stateVersion = "25.05";

  home.packages = [];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["nemo.desktop"];
      "application/x-gnome-saved-search" = ["nemo.desktop"];
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
  xdg.desktopEntries.nemo = {
    name = "Nemo";
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  };

  dconf = {
    settings = {
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "ghostty";
      };
    };
  };

  # --- Enabling or disabling apps --- #

  gh.enable = true;
  git.enable = true;
  k8s.enable = true;
  monitoring.enable = true;
  networking.enable = true;
  systools.enable = true;
  useful.enable = true;
  zsh.enable = true;
  alacritty.enable = true;
  ghostty.enable = true;
  chromium.enable = true;
  sway = {
    enable = true;
    swayidle.enable = true;
    swaylock.enable = true;
    wallpapers = ../../assets/wallpapers;
  };
  waybar.enable = true;
  firefox.enable = true;
  rofi.enable = true;
  tealdeer.enable = true;
  screenshotin.enable = true;
  rust.enable = true;
  docker.enable = true;
  mako.enable = true;
  claude.enable = true;
  direnv.enable = true;
  npm.enable = true;
  awscli.enable = true;
  calibre.enable = true;
  steam.enable = true;
}
