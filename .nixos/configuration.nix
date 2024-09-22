{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
	  	./packages.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true; # Enable networking

  time.timeZone = "America/Sao_Paulo"; # Set time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services = {
		xserver.xkb = {
    	layout = "br";
	    variant = "";
  	};
		displayManager.sddm = {
			enable = true;
			wayland.enable = true;
		};
	};

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yoru = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
		shell = pkgs.zsh;
  };

	programs = {
		nix-ld.enable = true;
		nix-ld.libraries = with pkgs; [
			# Add missing dynamic libraries for unpackaged programs here

		];
		zsh = {
			enable = true;
			enableCompletion = true;
			syntaxHighlighting.enable = true;
		};

		# nvim
		neovim = {
			enable = true;
			defaultEditor = true;
		};

		# Hyprland
		hyprland.enable = true;

		# Steam
		steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
			localNetworkGameTransfers.openFirewall = true;
			# gamescope %command% and gamemoderun %command
			# are steam launch options 
			# vimjoyer video on settings https://www.youtube.com/watch?v=qlfm3MEbqYA&t=213s 
			gamescopeSession.enable = true;
		};
		gamemode.enable = true;
	};

	# configurations for steam/gaming
	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};
	services.xserver.videoDrivers = ["amdgpu"];

	# audio/pipewire
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # It's perfectly fine and recommended to leave this value at the release version of the first install of this system.
  # Before changing this value read the documentation
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # it's better to not change
  
  nix.settings.experimental-features = ["nix-command" "flakes"]; # enable flakes
}
