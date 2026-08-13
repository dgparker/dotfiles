{
  description = "stuffz";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nixpkgs-linux.url = "github:NixOS/nixpkgs/nixos-26.05";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nix-homebrew,
      home-manager,
      nixpkgs,
      nixpkgs-linux,
    }:
    let
      linuxSystems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      forAllLinuxSystems = nixpkgs.lib.genAttrs linuxSystems;
      mkParrotHome =
        system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs-linux {
            inherit system;
            config.allowUnfree = true;
          };
          modules = [
            ./home.nix
            ./parrot.nix
          ];
        };
    in
    {
      darwinConfigurations."pooter" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dylan = import ./home.nix;
          }
        ];
      };

      homeConfigurations = {
        "dylan@parrot" = mkParrotHome "x86_64-linux";
        "dylan@parrot-aarch64" = mkParrotHome "aarch64-linux";
      };

      apps = forAllLinuxSystems (system: {
        parrot = {
          type = "app";
          program = "${(mkParrotHome system).activationPackage}/activate";
        };
      });

      checks = forAllLinuxSystems (system: {
        parrot-home = (mkParrotHome system).activationPackage;
      });
    };
}
