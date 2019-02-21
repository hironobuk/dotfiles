#!/bin/bash

if [[ -f "${HOME}/.bashrc" ]]; then
  echo "" >> "${HOME}/.bashrc"
fi

curl -s https://raw.githubusercontent.com/hironobuk/dotfiles/master/.bashrc >> "${HOME}/.bashrc"

for file in .bash_profile .vimrc .gitconfig .screenrc .tmux.conf; do
  curl -s -o "${HOME}/${file}" https://raw.githubusercontent.com/hironobuk/dotfiles/master/${file}
done

if [[ -n "$(which npm)" ]]; then
  npm completion > "${HOME}/.npm-completion.bash"
fi

mkdir -p "${HOME}/.vim/after/syntax"
curl -s -o "${HOME}/.vim/after/syntax/html.vim" https://raw.githubusercontent.com/hironobuk/dotfiles/master/ng-template.vim

curl -s -o "${HOME}/.git-completion.bash" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -s -o "${HOME}/.git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

