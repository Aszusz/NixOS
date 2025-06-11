{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";
  home.packages = [
    pkgs.chromium
    pkgs.vscodium
    pkgs.bitwarden
    pkgs.windsurf
    pkgs.ghostty
    pkgs.fastfetch
  ];
  # Add more Home Manager options here as needed
}
