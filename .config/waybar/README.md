# Waybar config hot reload (does not work on vscode terminal)

`while waybar & inotifywait -e close_write ~/.config/waybar/config.jsonc ~/.config/waybar/style.css; do pkill waybar; done`
