{ pkgs, inputs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = (
    with pkgs;
    [
      # Apps
      fuzzel
      gimp
      libreoffice
      lutris # gaming platform
      vlc
      nomacs
      vscode
      qbittorrent
      mcomix # comic/manga reader

      # browsers
      brave

      # Terminal
      kitty
      starship
      fastfetch
      btop

      # CLI utils
      git
      fzf
      wget
      zip
      unzip
      unrar
      ripgrep
      dunst # notifications
      libnotify # notification library
      dotool # input automation
      cava # audio visualizer
      usbutils # usb utilities
      inotify-tools # file system monitoring

      # Screenshotting/recording
      (flameshot.override { enableWlrSupport = true; })
      grim
      slurp
      wf-recorder

      # Clipboard
      wl-clipboard
      cliphist

      # Environment
      swaylock-effects
      swww
      ly
      waybar
      eww

      # Dependencies
      graalvmPackages.graalvm-ce # java vm
      gcc
      cargo
      nodejs
      xwayland
      xwayland-satellite
      nixfmt # nix formatter
      xdg-desktop-portal-gtk

      # for ASF
      dotnet-runtime
      icu

      # Langs
      python3

      # Sound
      pipewire
    ]
  );

  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      font-awesome
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
