{
  description = "NixOS configuration for thinkbook using flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      # Allow unfree packages for both stable and unstable
      nixpkgsConfig = {
        config = {
          allowUnfree = true;
        };
      };
      pkgs = import nixpkgs {
        inherit system;
        inherit (nixpkgsConfig) config;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        inherit (nixpkgsConfig) config;
      };
      username = "adrian";
    in
    {
      # NixOS system configurations
      nixosConfigurations = {
        thinkbook = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hardware-configuration.nix
            ./configuration.nix
            {
              # Make unstable packages available to all modules
              _module.args.pkgs-unstable = pkgs-unstable;
            }
          ];
        };
      };
      
      # Standalone home-manager configuration
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit pkgs-unstable; };
        modules = [
          ./home.nix
        ];
      };
    };
}
