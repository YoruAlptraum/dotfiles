{ pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
	};

	environment.systemPackages = with pkgs; [
		# Desktop
		firefox
		wofi

		# Terminal
		kitty
		zsh
		starship
		yazi
		neovim

		# CLI utils
		git 
		stow
		fastfetch
		htop
		wget

		# Environment
		hyprland
		hyprlock
		hyprpaper
		waybar

		# Sound
		pipewire
	];

	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-color-emoji

	];
}
