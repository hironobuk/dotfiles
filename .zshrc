export PATH="$(brew --prefix mysql-client@8.4)/bin:$PATH"

eval "$(mise activate zsh)"

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

alias ..='cd ../'
alias ....='cd ../../'

alias vi='nvim '
alias vim='nvim '

alias ls='ls -GF'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -lah'

autoload -Uz compinit
compinit

# Prompt: user@host current-directory (git-branch)
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' formats ' %F{cyan}(%b)%f'
zstyle ':vcs_info:*' enable git

if (( $+commands[scutil] )); then
  PROMPT_MACHINE_NAME="$(scutil --get ComputerName 2>/dev/null)"
fi
: "${PROMPT_MACHINE_NAME:=${HOST%%.*}}"

update_vcs_info() {
  vcs_info
}
add-zsh-hook precmd update_vcs_info

PROMPT='
%F{green}%n@${PROMPT_MACHINE_NAME}%f %F{yellow}%~%f${vcs_info_msg_0_}
$ '
