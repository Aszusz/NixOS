{ config, pkgs, ... }:

{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Environment variable for Wayland support
  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };

  # Enable CUPS to print documents
  services.printing.enable = true;
}
