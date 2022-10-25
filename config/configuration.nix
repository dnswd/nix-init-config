# Default system configuration.
# Help is available in the configuration.nix(5) man page and
# in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, user, flake-location, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "Default user";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Set time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
      LC_ADDRESS        = "id_ID.utf8";
      LC_IDENTIFICATION = "id_ID.utf8";
      LC_MEASUREMENT    = "id_ID.utf8";
      LC_MONETARY       = "id_ID.utf8";
      LC_NAME           = "id_ID.utf8";
      LC_NUMERIC        = "id_ID.utf8";
      LC_PAPER          = "id_ID.utf8";
      LC_TELEPHONE      = "id_ID.utf8";
      LC_TIME           = "id_ID.utf8";
    };
  };

  environment = {

    # Default environment variables
    variables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    # Default packages available
    systemPackages = [
      # Editor
      pkgs.neovim
      
      # Tools
      pkgs.git

      # OS Utilities
      pkgs.bind # installs dnsutils dev host lib man out
      pkgs.btop # resource manager
      pkgs.wget
      pkgs.kitty
      pkgs.zip
    ];

  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # Nix Package Manager Configuration 
  nix = {
    # Enable nix falakes
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # Garbage collection
    settings.auto-optimise-store = true;
    # gc = { # We don't need this since we have flakes
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 4w";
    # };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
  
}


