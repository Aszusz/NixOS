{ config, pkgs, pkgs-unstable, ... }: {
  imports = [
    ./home-modules/git.nix
    ./home-modules/windsurf.nix
    ./home-modules/chromium.nix
    ./home-modules/gnome-settings.nix
  ];
  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "adrian";
  home.homeDirectory = "/home/adrian";

  home.stateVersion = "25.05";
  home.packages = [
    pkgs.chromium
    pkgs.vscodium
    pkgs.bitwarden
    pkgs-unstable.windsurf
    pkgs.ghostty
    pkgs.fastfetch
    pkgs.megasync
    pkgs.caprine
    # GNOME Extensions moved to ./home-modules/gnome-settings.nix
  ];
  # Add more Home Manager options here as needed

  # Git configuration moved to ./home-modules/git.nix

  # Windsurf configuration moved to ./home-modules/windsurf.nix

  # Chromium configuration moved to ./home-modules/chromium.nix

  # GNOME settings moved to ./home-modules/gnome-settings.nix
}
