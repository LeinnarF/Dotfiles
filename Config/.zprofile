export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave"
export PATH="$HOME/.local/bin:$PATH"

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	# exec python ~/setup.py
	exec sway
fi

