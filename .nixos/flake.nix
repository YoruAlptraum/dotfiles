{
  description = "flake";

  inputs = {
    # pkgs channel
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:/nixos/nixpkgs/nixos-unstable";

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      nixosConfigurations.nix = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
}
