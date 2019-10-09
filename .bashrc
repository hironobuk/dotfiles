# SSHで毎回パスワードを聞かれないようにする
LOCAL_SSH_AGENT="${HOME}/.ssh/ssh-agent-${USER}"
if [[ -S "${SSH_AUTH_SOCK}" ]]; then
  if [[ "${SSH_AUTH_SOCK}" =~ ^/tmp/ssh-.+/agent.[0-9]+$ ]]; then
    ln -s -n -f "${SSH_AUTH_SOCK}" "${LOCAL_SSH_AGENT}"
    export SSH_AUTH_SOCK="${LOCAL_SSH_AGENT}"
  fi
elif [[ -S "${LOCAL_SSH_AGENT}" ]]; then
  export SSH_AUTH_SOCK="${LOCAL_SSH_AGENT}"
else
  eval $(ssh-agent)
  ssh-add
fi

if [[ $(pkill -0 -c -f /usr/bin/gpg-agent) == 0 ]]; then
  gpg-agent --daemon --no-grab
fi

export GPG_TTY=$(tty)
export GPG_AGENT_INFO

source "${HOME}/.git-completion.bash"
source "${HOME}/.git-prompt.sh"

if [[ -e "${HOME}/.npm-completion.bash" ]]; then
  source "${HOME}/.npm-completion.bash"
fi

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
  alias docker-stop='sudo docker ps -q | xargs --no-run-if-empty sudo docker stop'
  alias docker-volume-clean="sudo docker volume ls -q -f dangling=true | xargs --no-run-if-empty sudo docker volume rm "
  alias docker-image-clean="sudo docker images -q -f dangling=true | xargs --no-run-if-empty sudo docker rmi "
  alias docker-clean="docker-volume-clean && docker-image-clean"
fi
