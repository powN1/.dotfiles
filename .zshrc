# Enable vim mode
bindkey -v
# Enable backspace for deleting words in insert mode vim in zsh
bindkey "^H" backward-delete-char # backspace
bindkey "^?" backward-delete-char # del

# 10ms for key sequences
KEYTIMEOUT=1

# Enable colors and change prompt:
autoload -U colors && colors

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# use windows browser
export BROWSER=wslview

######## PATHS ########

# Include snap bin path
export PATH="/snap/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/$USER/.bun"
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# doom emacs
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="/usr/bin:$PATH"

# Include go bin path
export PATH="/usr/local/go/bin:$PATH"

# Include rust bin path
export PATH="$HOME/.cargo/env:$PATH"

# Include dotfiles bin path
export PATH="$HOME/.dotfiles/bin:$PATH"

#######################

# cwd to current dir when exiting yazi (y)
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

####### ALIASES #######
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gl='git log --oneline'

alias lg='lazygit'
#######################

# Set default editor to nvim
export EDITOR=nvim

# Starship (cli prompt customization)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

eval "$(starship init zsh)"

