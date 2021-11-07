# Configs

Делюсь своими конфигами.

## Универсально для многих ОС

```sh
# Установка Bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it \
&& ~/.bash_it/install.sh

# Установка SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

# Установка NVM N
curl -L https://git.io/n-install | bash

# Установка Node.js
n lts

# Установка Yarn
npm i -g yarn

# Настройка tmux
cd \
&& git clone https://github.com/gpakosz/.tmux.git \
&& ln -s -f .tmux/.tmux.conf \
&& cp .tmux/.tmux.conf.local .
```

## Конфигурация macOS через терминал

### Графический интерфейс ОС

- Подробнее о конфигурациях через defaults: [на сайте](https://macos-defaults.com/) или [на GitHub](https://github.com/yannbertrand/macos-defaults)
- Все настройки интерфейса можно будет откатить к системным, смотрите пункт выше про defaults.
- Если не будет изменений, перезагрузите компьтер.

```sh
# Не менять расположение пространств (рабочих столов) в зависимости от недавнего использования
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock

# Показывать расширения файлов в Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder

# Показывать скрытые файлы в Finder
# https://macos-defaults.com/finder/AppleShowAllFiles.html#set-to-true
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" && killall Finder

# Удалить из Dock все закрепленные приложения
defaults write com.apple.dock persistent-apps -array && killall Dock

# Не показывать в Dock недавние программы
# https://macos-defaults.com/dock/show-recents.html#set-to-false
defaults write com.apple.dock show-recents -bool no && killall Dock

# Автоматически скрывать Dock
defaults write com.apple.dock autohide -int 1 && killall Dock

# Мгновенное отображение Dock
# https://macos-defaults.com/dock/autohide-time-modifier.html#set-to-0
defaults write com.apple.dock "autohide-time-modifier" -float "0" && killall Dock

# Умеренный размер значков в Dock
# https://macos-defaults.com/dock/tilesize.html#set-to-48-default-value
defaults write com.apple.dock "tilesize" -int "48" && killall Dock

# Быстрое сворачивание и разворачивание окон
# https://macos-defaults.com/dock/mineffect.html#set-to-scale
defaults write com.apple.dock "mineffect" -string "scale" && killall Dock
```

### Рекомендую

```sh
# Установка Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Установка Git
brew install git

# Установка подсказок для bash
brew install bash-completion

# Установка раскладки клавиатуры от Ильи Бирмана
brew install --cask ilya-birman-typography-layout

# Установка Spectacle
brew install --cask spectacle

# Установка Chrome
brew install --cask google-chrome

# Установка Sublime Text
brew install --cask sublime-text
```

### Кому-то пригодится

```sh
# Установка VS Code
brew install --cask visual-studio-code

# Установка iTerm2
brew install --cask iterm2

# Установка Docker
brew install --cask docker

# Установка Nerd Fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Установка подсказок для Yarn
brew install yarn-completion
```

### Конфигурация Bash

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

## Настройка Git репозитория

- https://stackoverflow.com/a/18739064
- https://stackoverflow.com/a/11524807
- https://stackoverflow.com/a/24692818
- https://gist.github.com/bartoszmajsak/1396344

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

MERGE=$(cat $COMMIT_EDITMSG|grep '^Merge '|wc -l)

if [ $MERGE -eq 0 ] ; then
  addBranchName
fi

```
