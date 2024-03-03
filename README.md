# hyprland-empty-workspace
A very rudimentary bash script for hyprland to focus on the first available empty workspace on the same monitor. This resolves the problem that, when calling for an empty workspace with multi-monitor setups, the focus changes to another screen that alread has an empty workspace.

# example
Focus the empty workspace:

```bind = $mainMod, Slash, exec, $HOME/.config/hypr/scripts/monitor-new-workspace.sh```

Move windows to the empty workspace:

```bind = $mainMod SHIFT, Slash, exec, $HOME/.config/hypr/scripts/monitor-new-workspace.sh --move```
