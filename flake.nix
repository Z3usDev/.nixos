{
  description = "Z3usDev's NixOS Configuration";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixos-hardware,
    stylix,
    ...
  }@inputs: {
    nixosConfigurations.yokai = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        nixos-hardware.nixosModules.framework-amd-ai-300-series
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
