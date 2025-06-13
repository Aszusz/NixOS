{ config, pkgs, pkgs-unstable, ... }:

{
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
}
