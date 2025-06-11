{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GNOME Extensions
    gnomeExtensions.paperwm
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
  ];

  dconf.settings = {
    "org/gnome/desktop/background" = {
      # Set GNOME wallpaper via dconf
      picture-uri = "file:///home/adrian/MEGA/Wallpapers/CatppuccinMocha-Kurzgesagt-CloudyQuasar1.png";
      picture-uri-dark = "file:///home/adrian/MEGA/Wallpapers/CatppuccinMocha-Kurzgesagt-CloudyQuasar1.png";
      picture-options = "zoom";
    };
    "org/gnome/mutter" = {
      # Enable fractional scaling
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}
