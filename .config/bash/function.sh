# tmux ide-like
setup-tmux() {
  # Sauce: https://blog.inkdrop.app/my-dev-workflow-using-tmux-vim-video-e30e78a9acce
  tmux split-window -v -p 28
  #tmux split-window -h
  tmux select-pane -U
  tmux rename-window workspace
}

# git info
ginf() {
    # check if the current directory is in a git repository
    branch="$(git branch 2> /dev/null | grep '^*' | colrm 1 2)"
    if [ -z "$branch" ]; then
        echo ""
        return 0
    fi

    # check for git status
    git_status="$(git status --porcelain --branch)"
    git_dir="$(git rev-parse --git-dir 2>/dev/null)"

    num_staged=0
    num_changed=0
    num_conflicts=0
    num_untracked=0
    while IFS='' read -r line || [[ -n "${line}"  ]]; do
        status="${line:0:2}"
        while [[ -n ${status}  ]]; do
            case "${status}" in
                # two fixed character matches, loop finished
                \#\#) branch_line="${line/\.\.\./^}"; break ;;
                \?\?) ((num_untracked++)); break ;;
                U?) ((num_conflicts++)); break;;
                ?U) ((num_conflicts++)); break;;
                DD) ((num_conflicts++)); break;;
                AA) ((num_conflicts++)); break;;
                # two character matches, first loop
                ?M) ((num_changed++)) ;;
                ?D) ((num_changed++)) ;;
                ?\ ) ;;
                # single character matches, second loop
                U) ((num_conflicts++)) ;;
                \ ) ;;
                *) ((num_staged++)) ;;
            esac
            status="${status:0:(${#status}-1)}"
        done
    done <<< "${git_status}"
    unset status

    num_stashed=0
    stash_file="${git_dir}/logs/refs/stash"
    if [[ -e "${stash_file}"  ]]; then
        while IFS='' read -r wcline || [[ -n "${wcline}"  ]]; do
            ((num_stashed++))
        done < "${stash_file}"
    fi

    clean=0
    if (( num_changed == 0 && num_staged == 0 && num_untracked == 0 && num_stashed == 0 && num_conflicts == 0 )) ; then
        clean=1
    fi

    # put all things to variable
    if [ "$clean" -eq 1 ]; then
        git_status=" "
    else
        git_status=""
        if [ "$num_staged" -ne 0 ]; then
            git_status+=" ${num_staged}"
        fi
        if [ "$num_conflicts" -ne 0 ]; then
            git_status+=" ${num_conflicts}"
        fi
        if [ "$num_changed" -ne 0 ]; then
            git_status+=" ${num_changed}"
        fi
        if [ "$num_untracked" -ne 0 ]; then
            git_status+=" ${num_untracked}"
        fi
        if [ "$num_stashed" -ne 0 ]; then
            git_status+=" ${num_stashed}"
        fi
    fi

    # branch status
    IFS="^" read -ra fields <<< "${branch_line/\#\# }"
    branch="${fields[0]}"
    status=""
    if [[ "${#fields[@]}" -ne 1  ]]; then
        IFS="[,]" read -ra remotes <<< "${fields[1]}"
        for remote in "${remotes[@]}"; do
            if [[ "${remote}" == "ahead "*  ]]; then
                status+="↑${remote:6}"
            fi
            if [[ "${remote}" == "behind "*  ]]; then
                status+="↓${remote:7}"
            fi
        done
    fi

    # echo to PS1
    echo -e "\033[36mon \033[1;34m${branch}\033[33m${status}\033[1;31m${git_status}"

    # unset all variables
    unset branch git_dir num_staged num_changed num_conflicts num_untracked status num_stashed stash_file clean fields remotes
}

# https://github.com/chubin/cheat.sh
function cheat() { curl https://cheat.sh/"$@"; }
