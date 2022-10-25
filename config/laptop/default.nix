{ config, pkgs, user, ... }:

{
  imports = # For now, if applying to other system, swap files
    [(import ./hardware-configuration.nix)] ++                    # Current system hardware config @ /etc/nixos/hardware-configuration.nix
    [(import ../../modules/desktop/hyprland/default.nix)] ++      # Window Manager
    [(import ../../modules/desktop/virtualisation/docker.nix)] ++ # Docker
    (import ../../modules/hardware);                              # Hardware devices

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.timeout = 3; # Generation selection timeout
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # environment = {
  #   systemPackages = with pkgs; [
  #     simple-scan
  #   ];
  # };

  programs = {
    # Enable KDE Connect
    kdeconnect.enable = true;
  };

  services = {
    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [ pkgs.epson_201207w ];             # Epson L110 Driver
    };

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      
      # Enable KDE Plasma Desktop Environment
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;

      # Configure keymaps in X11
      layout = "us";
      xkbVariant = "";

      # Input configuration
      libinput = {
        # Touchpad configuration
        touchpad.tapping = true;                    # Tap-to-click
        touchpad.scrollMethod = "twofinger";        # Scroll with two fingers
        touchpad.naturalScrolling = true;           # Enable natural scrolling
      };
    };

    # Enable battery saving on laptop
    tlp.enable = true;

    # Optimize CPU on laptop
    auto-cpufreq.enable = true;
  };

}