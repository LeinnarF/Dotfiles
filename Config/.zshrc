fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="intheloop"

# Liked: intheloop, refined

plugins=(
	sudo
	zsh-autosuggestions
	zsh-syntax-highlighting
	z
)


bindkey '^ ' forward-word

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

# SDK tools to PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Aliases
alias config='cd ~/.config'
alias home='cd ~'
alias sp='sudo pacman'
alias ls='exa --icons=always --no-time --no-user --no-permissions'
alias cat='bat --theme=tokyonight_night'
alias y='yazi'
alias cd='z'
alias b='btop'
alias ff='fastfetch'
alias nvimconf='nvim ~/.config/nvim/'
alias g='lazygit'
alias settings='systemctl-tui'

eval "$(zoxide init zsh)"

source <(fzf --zsh)

# FZF theme
export FZF_DEFAULT_OPTS="
  --color=fg:#c0caf5,bg:#1a1b26,hl:#7aa2f7
  --color=fg+:#c0caf5,bg+:#24283b,hl+:#bb9af7
  --color=info:#7dcfff,prompt:#9ece6a,pointer:#f7768e
  --color=marker:#bb9af7,spinner:#7dcfff,header:#565f89
"

# NPM global
export PATH="$HOME/.npm-global/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Current Desktop sessions
export XDG_CURRENT_DESKTOP=sway

