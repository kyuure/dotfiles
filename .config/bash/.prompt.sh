case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null && [ "$EUID" -ne 0 ]; then 
    prompt_symbol=㉿
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u in \W\a\]$PS1"
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# git branch
_gbranch() {
  # check if the current directory is in a git repository.
  branch="$(git branch 2> /dev/null | grep '^*' | colrm 1 2)"
  if [ -z "$branch" ]; then
    echo ""
    return 0
  fi

  # print it.
  echo -e " \033[36mon \033[1;31m\033[1;34m${branch}"
}

# toggle on and off for safety
kubeon() {
  KUBE_PS1_ENABLED=on
}
kubeoff() {
  unset KUBE_PS1_ENABLED
}

# kube config
_kbconfig() {
  # if not enabled then exit
  if [[ "${KUBE_PS1_ENABLED}" != on ]]; then
    echo ""
    return 0
  fi

  # get cluster and namespace config
  cluster="$(kubectl config current-context 2>/dev/null)"
  namespace="$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"

  # print it.foo=${string#"$prefix"}
  if [[ -n "${cluster}" ]] && [[ -n "${namespace}" ]]; then
    echo -e " \033[36mat \033[1;31m⎈\033[1;34m${cluster}\033[00m:\033[1;34m${namespace}"
  fi
}

# da PROMPT
PS1=' \[\033[1;35m\]䷸'
PS1+=' \[\033[36m\]in'
PS1+=' \[\033[31m\]\W'
PS1+='$(_gbranch)'
PS1+='$(_kbconfig)'
PS1+=' \[\033[00m\]\n'
PS1+=' \[\033[1;36m\]'
PS1+=' \[\033[00m\]'
PS2='   \[\033[0;37m\]\[\033[00m\] '
