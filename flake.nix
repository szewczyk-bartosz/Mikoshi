{
  description = "Mikoshi - A samurai's NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosModules.default = import ./modules/nixos;
    homeManagerModules.default = import ./modules/home;
  };
}
