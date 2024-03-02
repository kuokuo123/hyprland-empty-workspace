# hyprland-empty-workspace
A simple bash script for hyprland to focus on the first available empty workspace on the same monitor. This resolve the problem that the built-in command focus on the wrong monitor when the first available empty workspace is on the other monitor.

# example
Focus the empty workspace:
```bind = $mainMod, Slash, exec, $HOME/.config/hypr/scripts/monitor-new-workspace.sh```
Move to the empty workspace:
```bind = $mainMod SHIFT, Slash, exec, $HOME/.config/hypr/scripts/monitor-new-workspace.sh --move```
