if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	# exec python ~/setup.py
	exect startplasma-wayland
fi

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"

# xremap ~/.config/xremap/config.yml &

# Short pause to ensure services start properly
# sleep 1
# clear
#
# print "Hello, $USER! Welcome to your terminal session."
# print "Today is $(date +"%A, %B %d, %Y")."
# print "Start desktop environment with 'startplasma-wayland' if not already running."

