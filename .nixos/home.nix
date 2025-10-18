{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    btop = "btop";
    hypr = "hypr";
    kitty = "kitty";
    nvim = "nvim";
    swappy = "swappy";
    waybar = "waybar";
    wofi = "wofi";
    "starship.toml" = "starship.toml";
  };
in {
  home = {
    username = "yoru";
    homeDirectory = "/home/yoru";
    stateVersion = "25.05";

    packages = with pkgs;
      [

      ];
    file = {
      ".bashrc".source = ../.bashrc;
      ".zshrc".source = ../.zshrc;
    };
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/.config/${subpath}";
    recursive = true;
  }) configs;

  programs = {
    vscode = {
      enable = true;

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

    chromium = {
      enable = true;
      package = pkgs.brave;

      extensions = [
        { id = "khncfooichmfjbepaaaebmommgaepoid"; } # Unhook
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
        { id = "faeadnfmdfamenfhaipofoffijhlnkif"; } # Black Theme
      ];
    };
  };
}
