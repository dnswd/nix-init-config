{ lib, inputs, nixpkgs, home-manager, nur, user, flake-location, ... }:

let
  # System architecture
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;

    # Allow proprietary software
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{

  # Profile for my MSI laptop
  msi = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user flake-location; };
    modules = [
      nur.nixosModules.nur
      ./laptop
      ./configuration.nix

      # Home-manager module
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = {
          imports = [(import ./home.nix)] ++ [(import ./laptop/home.nix)];
        };
      }
    ];
  };

}