{ config, pkgs, lib, ... }:

{
  # Enable Plymouth for a nice boot splash
  boot = {
    plymouth = {
      enable = true;
      theme = "hexagon_dots_alt";
      themePackages = with pkgs; [
        # Install only the rings theme from adi1090x's collection
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "hexagon_dots_alt" ];
        })
      ];
    };
    
    # Hide the OS choice for bootloaders unless a key is pressed
    loader.timeout = 0;
    
    # Silent boot configuration
    consoleLogLevel = 0;  # Hide all console messages
    initrd.verbose = false;
    
    # Kernel parameters for clean boot experience
    kernelParams = [
      "quiet"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
      "vt.global_cursor_default=0"  # Hide the cursor during boot
    ];
    
    # Make sure Plymouth works with LUKS
    initrd = {
      systemd.enable = true;  # Needed for proper Plymouth integration with LUKS
      
      # Ensure Plymouth is used for LUKS password prompt
      luks.devices = {
        "luks-256fa9b4-431e-4fef-99a5-14727a3bb96a" = {
          # We're not changing the device path, just adding Plymouth support
          allowDiscards = true;  # Better SSD performance
          preLVM = true;        # Unlock before LVM initialization
        };
      };
    };
  };
}
