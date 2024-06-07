# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac


#=== === === === === === === === === === === === === === === === === === === ===
# .dotfiles
# inspired by: https://github.com/mathiasbynens/dotfiles
#=== === === === === === === === === === === === === === === === === === === ===
for file in ~/.{aliases,env,functions,inputrc}; do
  [ -r "$file"  ] && [ -f "$file"  ] && source "$file";
done;
unset file;


#=== === === === === === === === === === === === === === === === === === === ===
# fancy prompt
#=== === === === === === === === === === === === === === === === === === === ===
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null && [ "$EUID" -ne 0 ]; then 
    prompt_symbol=㉿
    . ~/.prompt
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u in \W\a\]$PS1"
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi


# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# for fzf keybind
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# enable ctrl-r fzf
source /usr/share/doc/fzf/examples/key-bindings.bash

# for tmux bash history
# Avoid duplicates
HISTCONTROL=ignoredups:erasedups # Ubuntu default is ignoreboth
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend  # In Ubuntu this is already set by default
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
