{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-node.url = "github:nixos/nixpkgs/976fa3369d722e76f37c77493d99829540d43845";
    nixos-wsl.url = "github:nix-community/nixos-wsl";

    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, nix-node, nixos-wsl, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstablePkgs = import unstable { inherit system; };
      nodePkgs = import nix-node { inherit system; };
    in
    {
    
      nixosConfigurations.work = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs unstablePkgs nodePkgs system;
        };
        modules = [ 
          ./hosts/work/configuration.nix
        ];
      };

      nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs unstablePkgs nodePkgs system;
        };
        modules = [ 
          ./hosts/wsl/configuration.nix
          nixos-wsl.nixosModules.wsl
        ];
      };
    };
}
