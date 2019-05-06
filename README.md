# Настройка MacOS через терминал

```bash
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

## Насройка Git репозитория

Основано на https://gist.github.com/bartoszmajsak/1396344

```bash
cp .git/hooks/prepare-commit-msg.sample .git/hooks/prepare-commit-msg
vi .git/hooks/prepare-commit-msg
```

Содержимое для файла `.git/hooks/prepare-commit-msg`

```bash
#!/bin/bash

# This way you can customize which branches should be skipped when
# prepending commit message.
if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP=(master develop test)
fi

BRANCH_NAME=$(git symbolic-ref --short HEAD)
BRANCH_NAME="${BRANCH_NAME##*/}"

BRANCH_EXCLUDED=$(printf "%s\n" "${BRANCHES_TO_SKIP[@]}" | grep -c "^$BRANCH_NAME$")
BRANCH_IN_COMMIT=$(grep -c "\[$BRANCH_NAME\]" $1)

if [ -n "$BRANCH_NAME" ] && ! [[ $BRANCH_EXCLUDED -eq 1 ]] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then
  sed -i.bak -e "1s/^/[$BRANCH_NAME] /" $1
fi
```
