eval "$(mise activate zsh)"

export PATH="$(brew --prefix mysql-client@8.4)/bin:$PATH"

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
