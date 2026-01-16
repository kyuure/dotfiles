# vim
set -o vi
export EDITOR=vim
export VISUAL=vim
export VIMINIT='let $MYVIMRC="$CONFIG_DIR/vim/.vimrc" | source $MYVIMRC'


# language settings
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';


# check the window size after each command
shopt -s checkwinsize


# case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob # autocorrect typos in path names when using `cd`
shopt -s cdspell


# so the history doesn't have duplicate
HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=50000


# GUI WSL 2
export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"
export LIBGL_ALWAYS_INDIRECT=1


# for tmux bash history
# avoid duplicates
HISTCONTROL=ignoredups:erasedups
# when the shell exits, append to the history file instead of overwriting it
shopt -s histappend  # in ubuntu this is already set by default
# after each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# set golang env
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
