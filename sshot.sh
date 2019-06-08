#!/usr/bin/env bash
#
# This simple script uses maim and xclip to
# take screenshots, copy to clipboard and save
# in $HOME/Pictures/Screenshots user folder.
# Default action is copying to clipboard only.
#
# To install both required packages:
# $ sudo pacman -S xclip maim
#
# usage: screenshot {option}
# options:
#   --copy         copy to clipboard only (default)
#   --area         take a screenshot of an area only
#   --window       take a screenshot of a window only
#   --save         save to Screenshots folder
#   --save-area    save area to Screenshots folder
#   --save-window  save window to Screenshots folder

# user settings #

FOLDER="/home/neo/Pictures/Screenshots"
VIEWER="eog"

# argument vars #

ARG="$(echo "$1" | sed s:-::g)"
OPEN="$(echo "$2" | sed s:-::g)"

# output path #

OUTPUT="${FOLDER}/Screenshot $(date +"%Y-%m-%d %H:%M:%S").png"

# functions #

function help {
    head -n 17 "$0" | tail -n 7 | sed 's/# //'; }

function sshot {
    # take a full screen shot
    maim -u | xclip -selection clipboard -t image/png; }

function ssave {
    # save a full screen shot
    maim -u "$OUTPUT"
    xclip "$OUTPUT" -t image/png
    [[ "$OPEN" = "open" ]] && $VIEWER "$OUTPUT" & disown; }

function sarea {
    # take an area screen shot
    maim -u -s | xclip -selection clipboard -t image/png; }

function ssavearea {
    # save an area screen shot
    maim -u -s "$OUTPUT"
    xclip "$OUTPUT" -t image/png
    [[ "$OPEN" = "open" ]] && $VIEWER "$OUTPUT" & disown; }

function swindow {
    # take a window screen shot
    maim -u -i "$(xdotool getactivewindow)" | xclip -selection clipboard -t image/png; }

function ssavewindow {
    # save a window screen shot
    maim -u -i "$(xdotool getactivewindow)" "$OUTPUT"
    xclip "$OUTPUT" -t image/png
    [[ "$OPEN" = "open" ]] && $VIEWER "$OUTPUT" & disown; }

# execute #

mkdir -p "$FOLDER"

case "$ARG" in

    save)
        ssave
        ;;

    area)
        sarea
        ;;

    window)
        swindow
        ;;

    savearea)
        ssavearea
        ;;

    savewindow)
        ssavewindow
        ;;

    h|help)
        help
        ;;

    *) # default
        sshot
        ;;

esac # finishes