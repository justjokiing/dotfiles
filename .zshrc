#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

## history

# History file for zsh
HISTFILE=~/.zsh_history

# How many commands to store in history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

#### Custom ####

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -la"
alias s="kitten ssh"

export EDITOR=$(which nvim)
export TERM="xterm"

source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen bundle sudo

antigen apply

# Fix keybinds
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# starship prompt
eval "$(starship init zsh)"

export GOPATH=$HOME/.var/go
