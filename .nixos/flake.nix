{
  description = "flake";

  inputs = {
    # pkgs channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
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
        ];
        specialArgs = {
          inherit inputs outputs;
        };
      };
    };
}
