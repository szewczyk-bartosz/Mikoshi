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
    nixosModules = {
        default =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        {
          imports = [
            import ./modules/nixos/default.nix
          ];
          options.mikoshi = (import ./config.nix lib).mikoshiOptions;

          config = {
              nixpkgs.config.allowUnfree = true;
          };
        };
    };

    homeManagerModules = {
      # I have this weird feeling that if someone tries to build with this but doesn't include the module in their nixos system then this will break
      default =
      {
        config,
        lib,
        pkgs,
        osConfig,
        ...
      }:
      {
        imports = [
          import ./modules/home/default.nix
        ];
        options.mikoshi = (import ./config.nix lib).mikoshiOptions;
        config.mikoshi = osConfig.mikoshi;
      };
    };
    nixosModules.default = import ./modules/nixos;
    homeManagerModules.default = import ./modules/home;
  };
}
