{
  description = "Dennis' personal flake";

  inputs = {

    # Nix Packages -- using stable 22.05
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    
    # Home-manager -- user-wide package manager
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository -- community-driven repo for nix packages
    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, ... }:

    # Common variables in config files
    let
      user = "halcyon";
      flake-location = "$HOME/.flakeConfig"; 
    in {

      # NixOS configurations
      nixosConfigurations = (                                               
        import ./config {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager nur user flake-location;
        }
      );

    };
}
