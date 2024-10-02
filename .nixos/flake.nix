{

	description = "flake";

	inputs = {
		nixpkgs.url = "github:/nixos/nixpkgs/nixos-24.05";
		nixpkgs-unstable.url = "github:/nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, ... }:
		let
			lib = nixpkgs.lib;
		in {
		nixosConfigurations = {
			nix = lib.nixosSystem rec {
				system = "x86_64-linux";
				modules = [
					./configuration.nix
				];
				specialArgs = {
					nixpkgs-unstable = import nixpkgs-unstable {
						inherit system;
						config.allowUnfree = true;
					};
				};
			};
		};
	};

}
