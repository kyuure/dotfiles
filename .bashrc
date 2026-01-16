# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac


# Source bashrc .dotfiles
# inspired by: https://github.com/mathiasbynens/dotfiles
for file in ~/.config/bash/.{aliases,env,function,inputrc,prompt}.sh; do
  [ -r "$file"  ] && [ -f "$file"  ] && source "$file";
done;
unset file;


# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
