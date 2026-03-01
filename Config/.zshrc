fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# ==============================================================================
# ANTIDOTE PLUGIN MANAGER
# ==============================================================================

source /usr/share/zsh-antidote/antidote.zsh
antidote load

alias ant-rebuild='rm ~/.zsh_plugins.zsh && exe zsh'
alias ant-update='antidote update && antidote-rebuild'


# ==============================================================================
# KEYBINDINGS & ENVIRONMENT
# ==============================================================================

bindkey '^ ' forward-word
export EDITOR='nvim'
export XDG_CURRENT_DESKTOP=sway

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# NPM global
export PATH="$HOME/.npm-global/bin:$PATH"

export BAT_THEME='tokyonight_night'

export LS_COLORS="$(vivid generate tokyonight-night)"

# Vi-mode KEYBINDINGS
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd 'kj' vi-cmd-mode

bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line

function vi-yank-to-clipboard ()
{
	zle vi-yank
	print -rn -- "$CUTBUFFER" | wl-copy
	zle -M "Copied to clipboard"
}

zle -N vi-yank-to-clipboard
bindkey -M visual 'y' vi-yank-to-clipboard

# ==============================================================================
# ALIASES
# ==============================================================================

alias config='cd ~/.config'
alias home='cd ~'
alias sp='sudo pacman'
alias ls='eza --icons=always --no-time --no-user --no-permissions'
alias lsa='eza --all --icons=always --no-time --no-user --no-permissions'
alias cat='bat'
alias cd='z'
alias b='btop'
alias ff='fastfetch'
alias nvimconf='nvim ~/.config/nvim/'
alias g='lazygit'
alias settings='systemctl-tui'
alias py='python'

# ==============================================================================
# COLORS & FZF
# ==============================================================================

red='#f7768e'
green='#9ece6a'
yellow='#e0af68'
blue='#7aa2f7'
magenta='#bb9af7'
cyan='#7dcfff'
white='#c0caf5'
bg='#1a1b26'
bg_alt='#24283b'
fg_alt='#414868'

source <(fzf --zsh)
export FZF_DEFAULT_OPTS="
  --color=fg:$fg_alt,bg:$bg,hl:$red
  --color=fg+:$white,bg+:$bg,hl+:$green
  --color=info:$cyan,prompt:$green,pointer:$bg_alt
  --color=marker:$magenta,spinner:$cyan,header:$bg_alt
"

# Inject custom colors into fzf-tab
zstyle ':fzf-tab:*' fzf-flags \
  --color=fg:$fg_alt,bg:$bg,hl:$red \
  --color=fg+:$white,bg+:$bg,hl+:$green \
  --color=info:$cyan,prompt:$green,pointer:$bg_alt \
  --color=marker:$magenta,spinner:$cyan,header:$bg_alt \
	--color=border:$bg_alt

zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:(bat|cat|nvim|nano):*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

bindkey '^R' fzf-history-widget
bindkey '^t' fzf-file-widget

# ==============================================================================
# INITIALIZERS & WRAPPERS
# ==============================================================================

eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ==============================================================================
# COMPLETION SYSTEM SETTINGS
# ==============================================================================

# Initialize completion system
autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" 
zstyle ':completion:*' menu select 

zstyle ':completion:*' group-name ''
# zstyle ':completion:*:descriptions' format '[%d]'

zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
  '(out=$(man $word 2>/dev/null | head -n 5); [ -n "$out" ] && echo "$out") || echo "No manual entry"'





