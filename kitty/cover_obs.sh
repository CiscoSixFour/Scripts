#!/bin/zsh

MUSIC_DIR="/home/cisco/Music"
COVER="/tmp/album_cover.png"
COVER_SIZE="250"

## Path to current song (mpd) with mpc ##

	file="$MUSIC_DIR/$(mpc --format %file% current)"

	album="${file%/*}"

## Search for cover image ##

	art=$(find "$album"  -maxdepth 1 | grep -m 1 ".cover\.\(jpg\|png\)")
		if [ "$art" = "" ]; then
	  		art="$HOME/.config/ncmpcpp/default_cover.png"
		fi

## Copy and resize image to tmp with ffmpeg ##

	ffmpeg -loglevel 0 -y -i "$art" -vf "scale=$COVER_SIZE:-1" "$COVER"
