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
      dunst
      lutris
      vlc
      nomacs
      vscode
      qbittorrent
      mcomix

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

      # Dependencies
      graalvmPackages.graalvm-ce
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
