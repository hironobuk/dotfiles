# SSHで毎回パスワードを聞かれないようにする
eval $(ssh-agent)
ssh-add

source "${HOME}/.git-completion.bash"
source "${HOME}/.git-prompt.sh"

PS1='\n'                       # new line
PS1="$PS1"'\[\033[32m\]'       # change to green
PS1="$PS1"'\u@\h '             # user@host<space>
PS1="$PS1"'\[\033[35m\]'       # change to purple
#PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
PS1="$PS1"'\w'                 # current working directory
PS1="$PS1"'\[\033[36m\]'       # change color to cyan
PS1="$PS1"'`__git_ps1`'        # bash function
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $

alias vi='vim '
alias ls='ls -GF --color '
alias ll='ls -lhGF --color '
alias grep='grep --color '
alias tmux='tmux -2 '
alias ..='cd ../'
alias ....='cd ../../'

if [[ -n "$(which docker 2> /dev/null)" ]]; then
  alias docker-stop='sudo docker ps --format "{{.ID}}" | xargs --no-run-if-empty sudo docker stop'
fi
