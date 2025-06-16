# Thinkbook-specific configuration

{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ../../configuration-common.nix ];

  # Host-specific networking
  networking.hostName = "thinkbook";

  # Enable networking
  networking.networkmanager.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken.
  system.stateVersion = "25.05"; # Did you read the comment?
}
