# my own Aliases
alias v='vim'
alias nv='nvim'
alias g='git'
alias kb='kubectl'
alias kblogs='stern'
#alias bat='batcat -n --theme TwoDark --color "always"'
alias tree='tree -C'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
#alias clear='clear; cmatrix'
alias refresh='source ~/.bash_profile'

# ls
alias ls='ls -G --color=auto'
#alias ll='ls -alFh'
alias ll='eza -la --icons=always --git --no-user'

# cd
alias cdgotemp='cd ~/Work/temp'

# tmux
alias attach-tmux='tmux new -As0'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# python
alias p3='python3'
alias virenv-on='echo "   $(tput setaf 1)> $(tput setaf 2)source bin/activate$(tput sgr0)"; source bin/activate'
alias django-on='echo "   $(tput setaf 1)> $(tput setaf 2)python manage.py runserver$(tput sgr0)"; wslview http://127.0.0.1:8000/; python manage.py runserver'

# fzf
export FZF_COMPLETION_TRIGGER='==='
export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_OPTS='--multi --height 50% --cycle --keep-right --reverse'

# for wsl only
alias Ex='explorer.exe'
alias server-on='echo "   $(tput setaf 1)> $(tput setaf 2)python3 -m http.server$(tput sgr0)"; wslview http://localhost:8000; python3 -m http.server'
alias ctl-on='echo "   $(tput setaf 1)> $(tput setaf 2)systemctl enable$(tput sgr0)"; systemctl enable'
