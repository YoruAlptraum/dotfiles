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
    firefox
    chromium
    wofi
    gimp
    libreoffice
    dunst
    lutris
    # qbittorrent
    vlc
    nomacs
    vscode

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
