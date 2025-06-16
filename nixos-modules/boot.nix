{ config, pkgs, lib, ... }:

{
  # Enable Plymouth for a nice boot splash (except in VMs)
  boot = lib.mkMerge [
    # Common boot settings
    {
      loader.timeout = 0;
    }

    # Physical machine settings (not for VMs)
    (lib.mkIf (!config.virtualisation.virtualbox.guest.enable) {
      plymouth = {
        enable = true;
        theme = "hexagon_dots_alt";
        themePackages = with pkgs;
          [
            (adi1090x-plymouth-themes.override {
              selected_themes = [ "hexagon_dots_alt" ];
            })
          ];
      };

      consoleLogLevel = 0;
      initrd.verbose = false;

      kernelParams = [
        "quiet"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
        "boot.shell_on_fail"
        "vt.global_cursor_default=0"
      ];

      initrd = {
        systemd.enable = true;

        luks.devices = lib.mkIf (config.networking.hostName == "thinkbook") {
          "luks-256fa9b4-431e-4fef-99a5-14727a3bb96a" = {
            allowDiscards = true;
            preLVM = true;
          };
        };
      };
    })
  ];
}
