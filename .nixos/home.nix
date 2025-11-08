{ config, pkgs, inputs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    btop = "btop";
    kitty = "kitty";
    nvim = "nvim";
    swappy = "swappy";
    waybar = "waybar";
    "starship.toml" = "starship.toml";
    niri = "niri";
    fuzzel = "fuzzel";
    flameshot = "flameshot";
  };

  cursorPkg = pkgs.afterglow-cursors-recolored;
  cursorName = "Afterglow-Recolored-Catppuccin-Macchiato";
  themeName = "Tokyonight-Dark";
in {
  home = {
    username = "yoru";
    homeDirectory = "/home/yoru";
    stateVersion = "25.05";

    packages = with pkgs;
      [
        (pkgs.writeShellScriptBin "set-wallpaper" ''
          swww img "${config.home.homeDirectory}/dotfiles/imgs/wallpapers/mafuyu.png" --transition-type center
        '')
      ];

    file = {
      ".bashrc".source = ../.bashrc;
      ".zshrc".source = ../.zshrc;
    };

    pointerCursor = {
      package = cursorPkg;
      name = cursorName;
    };

    sessionVariables = {
      XCURSOR_PATH = "${pkgs.afterglow-cursors-recolored}/share/icons";
      XCURSOR_THEME = cursorName;
    };
  };

  # set GNOME dconf settings
  dconf.settings = {
    "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };
  };

  gtk = {
    enable = true;

    # Set the GTK theme
    theme = {
      name = themeName;
      package = pkgs.tokyonight-gtk-theme;
    };

    # Set the icon theme
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };

    gtk3.extraConfig = { gtk-application-prefer-dark-theme = 1; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = 1; };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };
    configFile = builtins.mapAttrs (name: subpath: {
      source = create_symlink "${dotfiles}/.config/${subpath}";
      recursive = true;
    }) configs;
  };

  programs = {
    vscode = {
      enable = true;

      profiles.default = {
        userSettings = {
          "editor.formatOnSave" = true;
          "workbench.sideBar.location" = "right";
          "workbench.colorTheme" = "Tokyo Night";
        };

        keybindings = [{
          key = "ctrl+'";
          command = "workbench.action.terminal.toggleTerminal";
          when = "terminal.active";
        }];

        extensions = with pkgs.vscode-extensions; [
          enkia.tokyo-night
          jnoortheen.nix-ide
        ];
      };
    };

    chromium = {
      enable = true;
      package = pkgs.brave;

      commandLineArgs = [ "--disable-features=ClipboardHistoryMenu" ];

      extensions = [
        { id = "khncfooichmfjbepaaaebmommgaepoid"; } # Unhook
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
        { id = "faeadnfmdfamenfhaipofoffijhlnkif"; } # Black Theme
      ];
    };

  };
}
