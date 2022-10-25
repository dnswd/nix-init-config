{ config, lib, pkgs, user, ... }:

{
  home.packages = [
    pkgs.slack
    pkgs.tdesktop # telegram
    pkgs.zoom-us
    pkgs.libreoffice
    pkgs.xournalpp
  ];
}
