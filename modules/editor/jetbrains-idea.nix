{ config, lib, pkgs, user, ... }:

{
  home.packages = [
    pkgs.jetbrains.idea-ultimate
  ];
}
