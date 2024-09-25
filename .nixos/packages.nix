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
		dunst

		# Terminal
		kitty
		starship
		yazi
		fastfetch
		btop

		# CLI utils
		git 
		stow
		fzf
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

	fonts = {
		packages = with pkgs; [
				noto-fonts
				noto-fonts-cjk-sans
				noto-fonts-color-emoji
				(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
				# Steam fonts
				source-code-pro
				source-han-mono
				source-han-sans
				source-han-serif
				wqy_zenhei
		];
		fontDir.enable = true;
		fontconfig.enable = true;
	};
}
