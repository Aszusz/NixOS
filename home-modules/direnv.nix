{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;

    config = {
      whitelist = {
        prefix = [
          "/home/adrian/Repos"  # This will allow all subdirectories
        ];
      };
    };
  };
}
