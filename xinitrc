#!/bin/sh

export EDITOR=vim
export BROWSER=chromium

xset +fp /usr/share/fonts/local &
xset fp rehash &

nitrogen --restore &

setxkbmap si &
thunar --daemon &
udiskie &
xset r rate 250 25 &
xset b off &
xsetroot -cursor_name left_ptr &
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

sxhkd &
mpd /home/mfin/.mpd/mpd.conf &
urxvtd -q -o -f &

pidof mpdas >& /dev/null
if [ $? -ne 0 ]; then
 mpdas &
fi

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO" &
mkfifo "$PANEL_FIFO" &
exec bspwm -s "$PANEL_FIFO" -p W
