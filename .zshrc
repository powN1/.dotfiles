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

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# use windows browser
export BROWSER=wslview

########### PATHS ###########

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

#############################

# cwd to current dir when exiting yazi (y)
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

########## ALIASES ##########
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gl='git log --oneline'
alias gc='git checkout'

alias lg='lazygit'
#############################

# Set default editor to nvim
export EDITOR=nvim

# Starship (cli prompt customization)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

