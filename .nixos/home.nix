{
  config,
  pkgs,
  inputs,
  ...
}:
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
    swaylock = "swaylock";
    eww = "eww";
  };

  cursorPkg = pkgs.afterglow-cursors-recolored;
  cursorName = "Afterglow-Recolored-Catppuccin-Macchiato";
  themeName = "Tokyonight-Dark";
in
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  home = {
    username = "yoru";
    homeDirectory = "/home/yoru";
    stateVersion = "25.05"; # do not change this value

    packages = with pkgs; [
      (pkgs.writeShellScriptBin "set-wallpaper" ''
        swww-daemon & swww img "${config.home.homeDirectory}/dotfiles/imgs/wallpapers/mafuyu.png" --transition-type center
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
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
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

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
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

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "JetBrainsMono Nerd Font" ];
      serif = [ "JetBrainsMono Nerd Font" ];
    };
  };

  programs = {
    zen-browser = {
      enable = true;
      policies =
        let
          mkExtensionSettings = builtins.mapAttrs (
            _: settings: {
              installation_mode = "force_installed";
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/${settings.pluginId}/latest.xpi";
              default_area = settings.defaultArea;
              private_browsing = settings.privateBrowsing;
              allowed_types = [ "extension" ];
            }
          );
        in
        {
          ExtensionSettings = mkExtensionSettings {
            "uBlock0@raymondhill.net" = {
              pluginId = "ublock-origin";
              defaultArea = "navbar";
              privateBrowsing = true;
            };
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
              pluginId = "bitwarden-password-manager";
              defaultArea = "navbar";
              privateBrowsing = true;
            };
            "addon@darkreader.org" = {
              pluginId = "darkreader";
              defaultArea = "menupanel";
              privateBrowsing = true;
            };
            "{6b733b82-9261-47ee-a595-2dda294a4d08}" = {
              pluginId = "yomitan";
              defaultArea = "menupanel";
              privateBrowsing = false;
            };
            "sponsorBlocker@ajay.app" = {
              pluginId = "sponsorblock";
              defaultArea = "menupanel";
              privateBrowsing = false;
            };
            "myallychou@gmail.com" = {
              pluginId = "youtube-recommended-videos";
              defaultArea = "navbar";
              privateBrowsing = false;
            };
            "{458160b9-32eb-4f4c-87d1-89ad3bdeb9dc}" = {
              pluginId = "youtube-anti-translate";
              defaultArea = "menupanel";
              privateBrowsing = false;
            };
          };

          AutofillAddressEnabled = true;
          AutofillCreditCardEnabled = false;
          DisableAppUpdate = true;
          DisableFeedbackCommands = true;
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DontCheckDefaultBrowser = true;
          NoDefaultBookmarks = true;
          OfferToSaveLogins = false;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
          Cookies = {
            Behavior = "reject-tracker-and-partition-foreign";
          };
          DefaultDownloadDirectory = "${config.home.homeDirectory}/Downloads";
          DisableSetDesktopBackground = true;
          DisplayBookmarksToolbar = "never";

          Homepage = {
            Locked = true;
            StartPage = "previous-session";
          };

          GenerativeAI = {
            Enabled = false;
            Chatbot = false;
            LinkPreviews = false;
            TabGroups = false;
          };
        };

      profiles.default = {
        isDefault = true;
        name = "Default";
        settings = {
          "zen.workspaces.continue-where-left-off" = true;
          "zen.tabs.show-newtab-vertical" = false;
          "zen.tabs.vertical" = true;
          "middlemouse.paste" = false;
          "general.autoScroll" = true;
          "zen.view.compact.show-sidebar-and-toolbar-on-hover" = false;
        };
      };
    };

    vscode = {
      enable = true;

      profiles.default = {
        userSettings = {
          "editor.formatOnSave" = true;
          "workbench.sideBar.location" = "right";
          "workbench.colorTheme" = "Tokyo Night";
          "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
        };

        keybindings = [
          {
            key = "ctrl+'";
            command = "workbench.action.terminal.toggleTerminal";
            when = "terminal.active";
          }
        ];

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
