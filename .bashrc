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
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
        prompt_color='\[\033[;94m\]'
        info_color='\[\033[1;31m\]'
        prompt_symbol=💀
        PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}('$info_color'\u${prompt_symbol}'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
    else
        # Starship Prompt
        # eval "$(starship init bash)"
        set_win_title() {
            echo -ne "\033]0;$(whoami)${prompt_symbol} in $(basename "$(pwd)")\a"
        }
        starship_precmd_user_func="set_win_title"

        prompt_symbol=㉿

        # my own prompt config
        . ~/.prompt
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u in \W\a\]$PS1"
    fi
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


# shell-color-scripts
#colorscript random
