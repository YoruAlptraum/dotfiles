{

	description = "flake";

	inputs = {
		nixpkgs.url = "github:/nixos/nixpkgs/nixos-24.05";
		nixpkgs-unstable.url = "github:/nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, ... }:
		{
			nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configuration.nix
				];
			};
		};
}
