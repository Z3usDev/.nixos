{
  description = "Z3usDev's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixos-hardware,
      stylix,
      ...
    }:
    let
      commonModules = [
        home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        nixos-hardware.nixosModules.framework-amd-ai-300-series
      ];
    in
    {
      nixosConfigurations.yokai = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = commonModules ++ [ ./hosts/framework-13-pro/default.nix ];
      };
    };
}
