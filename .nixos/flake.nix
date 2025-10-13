{
  description = "flake";

  inputs = {
    # pkgs channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [         
          {
            nix.settings.experimental-features = [ "nix-command" "flakes" ]; # enable flakes
          }
          ./configuration.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.yoru = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
        specialArgs = {
          inherit inputs outputs;
        };
      };
    };
}
