{ pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
	};

	environment.systemPackages = with pkgs; [
		# Apps 
		firefox
		wofi
		gimp
		libreoffice

		# Terminal
		kitty
		starship
		yazi
		neovim

		# CLI utils
		git 
		stow
		fastfetch
		btop
		wget

		# Screenshotting/recording
		grim
		slurp
		swappy
		wf-recorder

		# Environment
		hyprlock
		hyprpaper
		waybar
		wl-clipboard

		# Sound
		pipewire
	];

	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-color-emoji
		(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
	];
}
