{
  description = "Nix for mac";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      ...
    }:
    let
      username = "robin";
      system = "aarch64-darwin";
      hostname = "MacBookPro";

      specialArgs = inputs // {
        inherit username hostname;
      };

    in
    {
      darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [
          ./modules/nix-core.nix
          ./modules/system.nix
          ./modules/apps.nix
          ./modules/host-users.nix
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = false;
              user = "robin";
              autoMigrate = true;
            };
          }
        ];
      };
    };
}
