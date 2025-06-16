# Common configuration shared between all hosts

{ config, pkgs, lib, ... }:

{
  imports = [
    ./nixos-modules/desktop.nix
    ./nixos-modules/locale.nix
    ./nixos-modules/audio.nix
    ./nixos-modules/boot.nix
  ];

  # System features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.adrian = {
    isNormalUser = true;
    description = "Adrian Szuszkiewicz";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    nh
    fastfetch
    appimage-run
    nixfmt-classic
  ];
}
