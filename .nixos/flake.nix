{
  description = "flake";

  inputs = {
    # stable channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # unstable channel
    nixpkgs-unstable.url = "github:/nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm"
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, zen-browser, ... }: {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        {
          nix.settings.experimental-features =
            [ "nix-command" "flakes" ]; # enable flakes
        }
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        {
          home-manager = {
            extraSpecialArgs = { inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = true;
            users.yoru = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
