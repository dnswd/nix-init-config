{ pkgs, ... }:

{
  programs = {
    java.enable = true;
    java.package = pkgs.jdk8;
  };
}