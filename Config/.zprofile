if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startplasma-wayland
fi

export TERM=kitty
export EDITOR="vim"
