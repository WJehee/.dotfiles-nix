{ inputs, pkgs, ... }: {
    imports = [
        inputs.hyprland.homeManagerModules.default
    ];
    wayland.windowManager.hyprland = {
        enable = true;
        extraConfig = ''
monitor=,preferred,auto,1.5

exec-once = waybar &
exec-once = dunst &
exec-once = hyprpaper &
exec-once = wl-paste --watch cliphist &
exec-once = swayidle & disown
exec-once = nm-applet &

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,24

input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 2

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    gaps_in = 2
    gaps_out = 10
    border_size = 2
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    layout = master 
}

decoration {
    rounding = 5
    blur = no 
    blur_size = 3
    blur_passes = 1
    blur_new_optimizations = on

    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    # turn off workspace animations
    animation = workspaces, 0, 6, default
}

master {
    new_is_master = false
}

gestures {
    workspace_swipe = off
}

device:epic-mouse-v1 {
    sensitivity = -0.5
}

misc {
    disable_splash_rendering = true
}

# Keybinds
$mainMod = SUPER

bind = $mainMod, Return, exec, alacritty
bind = $mainMod SHIFT, Return, exec, wofi --show run
bind = $mainMod, Q, killactive, 
bind = $mainMod, M, exit, 
bind = $mainMod SHIFT, L, exec, swaylock --screenshots --clock --effect-blur 7x5 --grace 3

bind = $mainMod, F, exec, $BROWSER 

bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + h j k l
bind = $mainMod, L, movefocus, r
bind = $mainMod, H, movefocus, l
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
        '';
    };
}
