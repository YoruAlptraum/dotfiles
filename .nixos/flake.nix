{

	description = "flake";

	inputs = {
		nixpkgs.url = "github:/nixos/nixpkgs/nixos-24.05";
	};

	outputs = { self, nixpkgs, ... }:
		let
			lib = nixpkgs.lib;
		in {
		nixosConfigurations = {
			nix = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configuration.nix
				];
			};
		};
	};

}
