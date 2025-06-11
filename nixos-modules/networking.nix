{ config, pkgs, ... }:

{
  networking.hostName = "thinkbook"; # Define your hostname
  
  # Enable networking
  networking.networkmanager.enable = true;
}
