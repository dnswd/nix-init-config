{ pkgs, ... }:

{
  imports =
    [
      ../../modules/desktop/hyprland/home.nix # Window Manager
    ];

  # home = {                                # Specific packages for laptop
  #   packages = with pkgs; [
  #     libreoffice                         # Office packages
  #     jetbrains.idea-ultimate
  #   ];
  # };

  # programs = {
  #   alacritty.settings.font.size = 11;
  # };

  # Applets
  # services = {

  # };
}