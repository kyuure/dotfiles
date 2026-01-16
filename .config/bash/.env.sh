#=== === === === === === === === === === === === === === === === === === === ===
# vim
# because it is ...Read More
#=== === === === === === === === === === === === === === === === === === === ===
set -o vi
export EDITOR=vim
export VISUAL=vim


# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';


# so the history doesn't have duplicate
HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=50000
# check the window size after each command
shopt -s checkwinsize


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob # Autocorrect typos in path names when using `cd`
shopt -s cdspell


# GUI WSL 2
export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"
export LIBGL_ALWAYS_INDIRECT=1


# for tmux bash history
# Avoid duplicates
HISTCONTROL=ignoredups:erasedups # Ubuntu default is ignoreboth
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend  # In Ubuntu this is already set by default
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# set golang env
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

#vim
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/.vimrc" | source $MYVIMRC'
