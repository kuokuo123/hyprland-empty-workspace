# hyprland-empty-workspace
A very rudimentary bash script for hyprland to focus on the first available empty workspace on the same monitor. This resolves the problem that the built-in command focuses the other monitor when the first available empty workspace is not on the focused monitor.

# example
Focus the empty workspace:

```bind = $mainMod, Slash, exec, $HOME/.config/hypr/scripts/monitor-new-workspace.sh```

Move to the empty workspace:

```bind = $mainMod SHIFT, Slash, exec, $HOME/.config/hypr/scripts/monitor-new-workspace.sh --move```
