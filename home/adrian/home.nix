{ config, pkgs, pkgs-unstable, ... }:
{
  home.stateVersion = "25.05";
  home.packages = [
    pkgs.chromium
    pkgs.vscodium
    pkgs.bitwarden
    pkgs-unstable.windsurf
    pkgs.ghostty
    pkgs.fastfetch
    pkgs.megasync
    # GNOME Extensions
    pkgs.gnomeExtensions.paperwm
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.appindicator
  ];
  # Add more Home Manager options here as needed

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Adrian Szuszkiewicz";
    userEmail = "adrianszuszkiewicz@gmail.com";
  };

  # Windsurf (VS Code fork) configuration
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.windsurf;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # Theme and Icons
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      
      # Nix support
      jnoortheen.nix-ide
      
      # Code quality and formatting
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      
      # Git tools
      mhutchie.git-graph
    ];
  };

  # Chromium extensions
  programs.chromium = {
    enable = true;
    extensions = [
      # uBlock Origin Lite
      "ddkjiahejlhfcafbddmgiahcphecmpfh"
      # Bitwarden
      "nngceckbapebfimnlniiiahkandclblb"
      # Vimium
      "dbepggeogbaibhgnhhndojpepiihcmeb"
      # Accept all cookies
      "ofpnikijgfhlmmjlpkfaifhhdonchhoi"
    ];
  };

  # GNOME wallpaper via dconf
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/adrian/MEGA/Wallpapers/CatppuccinMocha-Kurzgesagt-CloudyQuasar1.png";
      picture-uri-dark = "file:///home/adrian/MEGA/Wallpapers/CatppuccinMocha-Kurzgesagt-CloudyQuasar1.png";
      picture-options = "zoom";
    };
    "org/gnome/mutter" = {
      # note: this must be a plain list, not a mkList
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}
