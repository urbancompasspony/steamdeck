#!/bin/bash

# Using transformation matrix bits taken from:
#   https://wiki.ubuntu.com/X/InputCoordinateTransformation

# Based on:
# https://linuxappfinder.com/blog/auto_screen_rotation_in_ubuntu
# https://gist.github.com/mildmojo/48e9025070a2ba40795c
# https://gist.github.com/ACamposPT/6794aa02a6e5e341f123d447b3645b93

# Set the correct screen position through "Display" GUI; then run this to set correct touchscreen position:

xrandr --current --verbose -o $1

TOUCHSCREEN='FTS3528:00 2808:1015'
TRANSFORM='Coordinate Transformation Matrix'

case "$1" in
  normal)
    [ ! -z "$TOUCHSCREEN" ] && xinput set-prop "$TOUCHSCREEN" "$TRANSFORM" 1 0 0 0 1 0 0 0 1
    ;;
  inverted)
    [ ! -z "$TOUCHSCREEN" ] && xinput set-prop "$TOUCHSCREEN" "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
    ;;
  left)
    [ ! -z "$TOUCHSCREEN" ] && xinput set-prop "$TOUCHSCREEN" "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
    ;;
  right)
    [ ! -z "$TOUCHSCREEN" ] && xinput set-prop "$TOUCHSCREEN" "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
    ;;
esac
