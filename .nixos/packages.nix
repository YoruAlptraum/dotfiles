{ pkgs, pkgs-unstable, inputs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = (with pkgs-unstable; [
    inputs.zen-browser.packages."${system}".twilight-official # beta
  ])

  ++

  (with pkgs; [
    # Apps
    wofi
    gimp
    libreoffice
    dunst
    lutris
    vlc
    nomacs
    vscode
    # qbittorrent
    # browsers
    brave
    librewolf

    # Terminal
    kitty
    starship
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
    dotool # input automation
    cava # audio visualizer
    usbutils # usb utilities
    inotify-tools # file system monitoring

    # Screenshotting/recording
    grim
    slurp
    swappy
    wf-recorder

    # Clipboard
    wl-clipboard
    cliphist

    # Environment
    hyprlock
    hyprpaper
    waybar

    # Dependencies 
    graalvm-ce
    gcc
    cargo
    nodejs
    xwayland
    nixpkgs-fmt # nix formatter

    # for ASF
    dotnet-runtime
    icu

    # Langs
    python3

    # Sound
    pipewire
  ]);

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
