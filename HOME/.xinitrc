#!/bin/bash

pulseaudio --start &
hsetroot -solid "#bcb49c" &
polybar date &
polybar music &
mocp -S &
mocp -a /mnt/nas/Classical &
exec dwm
