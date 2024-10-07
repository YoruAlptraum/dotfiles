{

	description = "flake";

	inputs = {
		nixpkgs.url = "github:/nixos/nixpkgs/nixos-24.05";
		nixpkgs-unstable.url = "github:/nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, ... } @ inputs:
		{
			nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./configuration.nix
					{ 
						nixpkgs.overlays = [
							(self: super: {
								neovim = inputs.nixpkgs-unstable.neovim;
							})
						];
					}
				];
			};
		};
}
