{ pkgs, inputs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
	};
	
	environment.systemPackages = with pkgs; [
		# Apps 
		firefox
		chromium
		wofi
		gimp
		libreoffice
		dunst
		lutris
		qbittorrent
		vlc
		nomacs

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
		zip
		unzip
		unrar
		ripgrep

		# Dependencies 
		graalvm-ce
		gcc
		cargo
		nodejs
		xwayland
		# for ASF
		dotnet-runtime
		icu

		# Langs
		python3

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
				noto-fonts-cjk-serif
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
