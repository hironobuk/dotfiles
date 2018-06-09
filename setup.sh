#!/bin/bash

if [[ -f ${HOME}/.bashrc ]]; then
  echo "" >> ${HOME}/.bashrc
fi

curl -s https://raw.githubusercontent.com/hironobuk/dotfiles/master/.bashrc >> ${HOME}/.bashrc

for file in .bash_profile .vimrc .gitconfig; do
  curl -s -o ${HOME}/${file} https://raw.githubusercontent.com/hironobuk/dotfiles/master/${file}
done

# --list-cmdsオプションが存在しないと怒られるのでしばらくはリビジョンを固定
curl -s -o ${HOME}/.git-completion.bash https://raw.githubusercontent.com/git/git/8b4c2e0b1c4ff47c07b2c1bbc937bb46e889755e/contrib/completion/git-completion.bash
curl -s -o ${HOME}/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

