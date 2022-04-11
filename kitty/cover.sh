#!/bin/zsh

COVER="/tmp/album_cover.png"

function add_cover {
    #kitty +kitten icat /tmp/album_cover.png
    kitty +kitten icat --transfer-mode=file --clear 2>/dev/null
	kitty +kitten icat --z-index -5 --scale-up --transfer-mode=file --place "14x14@1x0" "$COVER" 2>/dev/null

}


(
	if [ ! -f "$COVER" ]; then
		cp "$HOME/.config/ncmpcpp/default_cover.png" "$COVER"
	fi

## Rerender image when changed ##

	while inotifywait -q -q -e close_write "$COVER"; do
		add_cover
	done
)
