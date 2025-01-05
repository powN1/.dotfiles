# Enable colors and change prompt:
autoload -U colors && colors

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# use windows browser
export BROWSER=wslview

######## PATHS ########
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
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Set default editor to nvim
export EDITOR=nvim

# Starship (cli prompt customization)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

ZSH PATH


