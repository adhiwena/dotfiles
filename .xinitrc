#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

##################
# Autostart apps #
##################

# keyring
# eval $(/usr/bin/gnome-keyring-daemon --start)
# export SSH_AUTH_SOCK

exec dunst &
exec /home/adhiwena/.screenlayout/monitor.sh & # resolution n refresh rate
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & # polkit popup
exec xsetroot -cursor_name left_ptr & # load cursor theme
exec numlockx & # on numlock
exec picom & # transparency, blur, etc
exec snapshot-detect & # timeshift snapshot auto detect
# exec udiskie --tray & # auto mount usb drive

# Kill all URxvt Daemon if exist
killall -q urxvtd
exec urxvtd &

exec bspwm # polybar inside bspwm

