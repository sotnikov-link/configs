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

# Установка Node.js
brew install node

# Установка Yarn
brew install yarn

# Установка подсказок для Yarn
brew install yarn-completion

# Установка NVM N
npm i -g n
```
