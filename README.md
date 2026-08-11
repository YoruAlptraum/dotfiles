# My dotfiles repo - nixos

Repo for all my dotfiles.

# Getting started

Clone this repo on home `~`, replace the `hardware-configration.nix` file with the one generated after nixos installation (located on `/etc/nixos/hardware-configuration.nix`) and use `sudo nixos-rebuild switch --flake ~/dotfiles/.nixos/#nix` to build the system for the first time, after the first build you can use the alias `nixos-build` instead

# Screenshots

| -                | -    | Screenshot                                                     |
| ---------------- | ---- | -------------------------------------------------------------- |
| file manager     | yazi | <img src="imgs/screenshots/yazi.png" alt="yazi" width="800" /> |
| resource monitor | btop | <img src="imgs/screenshots/btop.png" alt="btop" width="800" /> |
