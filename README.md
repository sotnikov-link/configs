# Настройка MacOS через терминал

```sh
# Удалить из Dock все закрепленные приложения
defaults write com.apple.dock persistent-apps -array

# Не показывать в Dock недавние программы
defaults write com.apple.dock show-recents -bool no

# Автоматически скрывать Dock
defaults write com.apple.dock autohide -int 1

# Перезапуск Dock для применения изменений, если не сработает, тогда нужна перезагрузка
killall Dock

# Установка Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Установка Bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# Установка SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

# Установка Chrome
brew cask install google-chrome

# Установка Nerd Fonts
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# Установка iTerm2
brew cask install iterm2

# Установка подсказок для bash
brew install bash-completion

# Установка VS Code
brew cask install visual-studio-code

# Установка Sublime Text
brew cask install sublime-text

# Установка Spectacle
brew cask install spectacle

# Установка Git
brew install git

# Установка Docker
brew cask install docker

# Установка NVM N
curl -L https://git.io/n-install | bash

# Установка Node.js
n lts

# Установка Yarn
npm i -g yarn

# Установка подсказок для Yarn
brew install yarn-completion
```

## Обновление bash

По статье [Upgrading Bash on macOS (itnext.io)](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba)

```sh
# Установка новой версии bash через brew
brew install bash

# Разрешить использовать новую оболочку по умолчанию для пользователей
sudo vim /etc/shells
# В конец файла добавить строку: «/usr/local/bin/bash»

# Сменить оболочку для текущего пользователя
chsh -s /usr/local/bin/bash

# Сменить оболочку для пользователя root
sudo chsh -s /usr/local/bin/bash
```

## Насройка Git репозитория

```sh
cp .git/hooks/prepare-commit-msg.sample .git/hooks/prepare-commit-msg
vi .git/hooks/prepare-commit-msg
```

Содержимое для файла `.git/hooks/prepare-commit-msg`

```sh
#!/bin/sh

#
# Automatically add branch name and branch description to every commit message
# except merge commit
#

COMMIT_EDITMSG=$1

addBranchName() {
  NAME=$(git branch | grep '*' | sed 's/* //')
  DESCRIPTION=$(git config branch."$NAME".description)
  echo "[$NAME] $(cat $COMMIT_EDITMSG)" > $COMMIT_EDITMSG
  if [ -n "$DESCRIPTION" ]
  then
     echo "" >> $COMMIT_EDITMSG
     echo $DESCRIPTION >> $COMMIT_EDITMSG
  fi
}

MERGE=$(cat $COMMIT_EDITMSG|grep '^Merge branch'|wc -l)

if [ $MERGE -eq 0 ] ; then
  addBranchName
fi

```

* https://stackoverflow.com/a/18739064
* https://stackoverflow.com/a/11524807
* https://stackoverflow.com/a/24692818
* https://gist.github.com/bartoszmajsak/1396344
