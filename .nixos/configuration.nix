{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Enable networking

  time.timeZone = "America/Sao_Paulo";

  i18n = {
    supportedLocales = [ "en_US.UTF-8/UTF-8" "zh_TW.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" "ko_KR.UTF-8/UTF-8" ];
    defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.
    extraLocaleSettings = {
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
  };

  # Configure keymap in X11
  services = {
    gnome.gnome-keyring.enable = true;
    xserver = {
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "br";
        variant = "";
      };
    };
    displayManager = {
      ly = {
        enable = true;
      };
      sessionPackages = [pkgs.hyprland];
    };
    archisteamfarm = {
      enable = true;
    };
  };

  # Enable the Gnome keyring
  security.pam.services.sddm.enableGnomeKeyring = true;

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yoru = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd" # for vm
    ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  # vm
  virtualisation.libvirtd.enable = true;

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

    # file manager
    yazi = {
      enable = true;
    };

    # Hyprland
    hyprland.enable = true;

    # Steam
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      # gamescope -W 1920 -H 1080 -r 60 -- %command%
      # gamemoderun %command%
      # are steam launch options 
      # vimjoyer video on settings https://www.youtube.com/watch?v=qlfm3MEbqYA&t=213s 
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };

    # vm
    virt-manager.enable = true;
  };

  # vm settings
  virtualisation.spiceUSBRedirection.enable = true;
  services.spice-vdagentd.enable = true;

  # configurations for steam/gaming
  hardware.graphics = {
    enable = true;
  };

  # audio/pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # setting default applications
  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
  };

  # automatic cleanup of old builds
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true; # deduplicate store files and optimize store

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # It's perfectly fine and recommended to leave this value at the release version of the first install of this system.
  # Before changing this value read the documentation
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # enable flakes
  system.stateVersion = "25.05"; # it's better to not change
}
