# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os, subprocess


mod = "mod1"

#myTerminal = guess_terminal()
myTerminal = "kitty"
myBrowser = "firefox"
myEmailClient = "thunderbird"


# A list of available commands that can be bound to keys can be found
# at https://docs.qtile.org/en/latest/manual/config/lazy.html

keys = [

    ##############
    # LAYOUTS / WINDOWS
    ##############

    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "tab", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    # Key([mod, "shift"], "h", lazy.layout.swap_left(), desc="Swap window to the left"),
    # Key([mod, "shift"], "l", lazy.layout.swap_right(), desc="Swap window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "s", lazy.layout.toggle_auto_maximize(), desc=""),
    Key([mod, "shift"], "i", lazy.layout.grow()),
    Key([mod, "shift"], "m", lazy.layout.shrink()),
    Key([mod, "shift"], "o", lazy.layout.maximize()),
    Key([mod, "shift"], "n", lazy.layout.reset()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    # Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    # Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    # Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),


    ##############
    # APPLICATIONS
    ##############

    #Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key(
        [mod], "d", lazy.spawn("rofi -show drun -show-icons"),
        desc="Launch Rofi application launcher",
    ),

    Key([mod], "Return", lazy.spawn(myTerminal), desc="Launch terminal"),
    Key([mod], "f", lazy.spawn(myTerminal + " -e ranger"), desc="Launch file explorer"),
    Key([mod], "b", lazy.spawn(myBrowser), desc="Launch internet browser"),
    Key([mod], "e", lazy.spawn(myEmailClient), desc="Launch email client"),

    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key(
        [mod, "shift"], "f", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),

    # Key([mod], "y", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "control"], "s", lazy.spawn("systemctl suspend"), desc="Suspend system"),
    # Key([mod], "n", lazy.spawn("notify-send 'Qtile' 'Hello from your config!'")),


    ##############
    # MEDIA KEYS
    ##############

    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%"), desc="brightness up"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-"), desc="brightness down"),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%")),

]


# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in derRult config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_theme = {
    "border_width": 2,
    "margin": 4,
    "border_focus": "#bd93f9",
    "border_normal": "#282a36"
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(),
    layout.Stack(**layout_theme, num_stacks=2),
    # layout.Columns(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.Zoomy(**layout_theme),
]


widget_defaults = {
    'font': 'Atkinson Hyperlegible Bold',
    'fontsize': 14,
    'padding': 3,
    'background': '#282a36', # Dracula background
    'foreground': '#ffffff',
}

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.Spacer(length=bar.STRETCH),
                widget.WindowName(),
                widget.Spacer(length=bar.STRETCH),
                # widget.Chord(
                    # chords_colors={
                        # "launch": ("#ff0000", "#ffffff"),
                    # },
                    # name_transform=lambda name: name.upper(),
                # ),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # widget.Systray(),
                # widget.Notify(),
                widget.Volume(
                    fmt='Volume {}',
                    cardid = None,
                    device = None,
                    theme_path = None,
                    volume_app = 'pavucontrol',
                    get_volume_command = 'pactl get-sink-volume @DEFAULT_SINK@',
                    check_mute_command = 'pactl get-sink-mute @DEFAULT_SINK@',
                    check_mute_string = 'Mute: yes',
                    padding=8,
                    foreground='#ffffff',
                    # This manually maps the pactl commands we discussed earlier
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Battery(
                    format = 'Battery {percent:2.0%}{char}',
                    foreground = '#ffffff',
                    low_foreground = '#ff5555',
                    low_percentage = 0.2,
                    notify_below = 15,
                    notification_timeout = 0,
                    padding=8,
                    discharge_char='',
                ),
                widget.Clock(
                    format="%Y-%m-%d %a %I:%M %p",
                    padding=8,
                ),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list 
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = False

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    processes = [
        ['picom', '-b'],
        ['setxkbmap', '-option', 'ctrl:nocaps'],
        # ['nm-applet'],
        ['feh', '--bg-fill', '/usr/share/images/desktop-base/default'],
        ['dunst'],
    ]

    for p in processes:
        subprocess.Popen(p)
