# Настройки

Делюсь своими настройками для macOS, VS Code и прочим. Что-то можно адаптировать
под Linux, Windows.

Разделы расположены по убыванию массового интереса. Материал содержит
«todo-заметки» и будет редактироваться по возможности и необходимости.

## macOS

Основано на [macOS defaults list](https://macos-defaults.com/)
([GitHub](https://github.com/yannbertrand/macos-defaults)). Настройки можно
откатавать к системным, информация доступна по ссылкам. Если нет изменений,
перезагрузите компьтер.

### Spotlight и Siri

> todo:
>
> - горячие клавиши `Cmd` + `Space` для Spotlight
> - включить для Siri клавиши `Cmd` + `Space` с удержанием
> - запуск программ через Spotlight

### Dock

```sh
# Удалить из Dock все закрепленные приложения
defaults write com.apple.dock persistent-apps -array && killall Dock

# Не показывать в Dock недавние программы
# https://macos-defaults.com/dock/show-recents.html#set-to-false
defaults write com.apple.dock show-recents -bool no && killall Dock

# Автоматически скрывать Dock
defaults write com.apple.dock autohide -int 1 && killall Dock

# Умеренный размер значков в Dock
# https://macos-defaults.com/dock/tilesize.html#set-to-48-default-value
defaults write com.apple.dock "tilesize" -int "48" && killall Dock

# Быстрое сворачивание и разворачивание окон
# https://macos-defaults.com/dock/mineffect.html#set-to-scale
defaults write com.apple.dock "mineffect" -string "scale" && killall Dock

# Не менять расположение пространств (рабочих столов, spaces) в зависимости от недавнего использования
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock
```

### Finder

```sh
# Показывать расширения файлов в Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder

# Показывать скрытые файлы в Finder
# https://macos-defaults.com/finder/AppleShowAllFiles.html#set-to-true
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" && killall Finder
```

> todo: табличное представление

### Системные настройки

- [Изменение веб-браузера и почтового приложения по умолчанию](https://support.apple.com/HT201607)

#### Меню возле времени сверху справа

[Настройте «Пункт управления»](https://support.apple.com/guide/mac-help/control-center-mchl50f94f8f/mac)
для быстрого доступа к разным настройкам, например: Bluetooth, Wi-Fi, Звук,
Яркость экрана и клавиатуры. Уберите всё лишнее из меню и добавьте необходимое.

#### Трекпад

- Включить «Касание для имитации нажатия мыши».
- Отключить «Смахивание между страницами», чтобы случайно не перескакивать
  на предыдущие страницы в веб-браузерах при «неаккуратной» прокрутке страниц 🔥

Описание настроек:
https://support.apple.com/guide/mac-help/change-trackpad-preferences-mchlp1226/mac

#### Полезные сочетания клавиш

- `Control` + `F7` включает
  [«переключение по кнопкам и полям ввода через Tab»](https://support.apple.com/guide/mac-help/use-your-keyboard-like-a-mouse-mchlp1399/mac).
  Повторное нажатие отключит данную функцию.
- Для вставки Emoji и других спец-символов в тексте нажмите `Control` +
  `Command` + `Пробел` или `Fn` + `E`. Последняя комбинация может не работать
  на сторонних клавиатурах.
- [Cкриншоты и скринкасты](https://support.apple.com/guide/mac-help/take-screenshots-or-screen-recordings-mh26782/mac)
  - `Command` + `Shift` + `5` для записи или снимка экрана в разных режимах;
  - `Command` + `Shift` + `4` для снимка части экрана с сохранением в файл;
  - `Command` + `Shift` + `Control` + `4` для снимка части экрана с сохранением
    в буфер обмена.

#### Авто-исправление ошибок в тексте

Если не нравится, что текст автоматически меняется, рекомендую отключить
в системных настройках:

- [Автоматически исправлять ошибки](https://support.apple.com/guide/mac-help/check-spelling-and-grammar-on-mac-mchlp2299/mac)
- [Автоматически писать слова с заглавной буквы](https://support.apple.com/guide/mac-help/mh27071/mac)
- [Использовать смарт-кавычки и тире](https://support.apple.com/guide/mac-help/mh35735/mac)

`Command` + `;` для поиска по одной ошибки в тексте. `Command` + `:` для поиска
всех ошибок в тексте, но это работает не во всех полях ввода 🤷‍♂️ Любой поиск
ошибок работает не зависимо от включенных или отключенных авто-исправлений.

##### Telegram

Можно включить подсветку ошибок при вводе текста: перейти в поле ввода
сообщения, затем в меню «Правка», в разделе «Орфография и грамматика» выбрать
«Проверять правописание при вводе» и «Проверять грамматику и орфографию».

### Установка программ через HomeBrew

- https://brew.sh/
- Далее будут установки приложений, которые используют HomeBrew. Для начала сам
  HomeBrew нужно установить. Это необязательно, но тогда вам нужно будет
  самостоятельно искать официальные установщики программ и следить
  за обновлениями. HomeBrew упрощает этот процесс, если вы готовы использовать
  команды HomeBrew, которые нужно вводить
  [в «Терминал»](https://support.apple.com/guide/terminal/apd5265185d-f365-44cb-8b09-71a064a42125/mac).

```sh
# Установка HomeBrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Диагностика проблем HomeBrew
brew doctor
```

#### Программы

- Поиск в HomeBrew через команду `brew search` или на сайте
  https://formulae.brew.sh/
- [Обновляемый список лучших программ для macOS](https://github.com/jaywcjlove/awesome-mac)

```sh
# Установка Chrome
brew install --cask google-chrome

# Установка VS Code
brew install --cask visual-studio-code

# Установка Telegram
brew install --cask telegram
```

### Работа с архивами

- С просмотром архивов без распаковки 🔥
- https://ezip.awehunt.com/

```sh
# Установка MacZip
brew install --cask maczip
```

### Раскладка клавиатуры от Ильи Бирмана

> todo: минимум «Русская ПК»

> todo: простой способ без HomeBrew

```sh
# Установка раскладки клавиатуры от Ильи Бирмана
brew install --cask ilya-birman-typography-layout
```

**Как отключить системную английскую раскладку U. S. или ABC, которая мне теперь
не нужна?** Хаком. В зависимости от версии операционной системы вам подойдёт
один из методов:

- добавить японскую раскладку Kotoeri, удалить системную английскую, удалить
  японскую;
- добавить японскую раскладку Romaji, поставить в ней галку «Ромадзи», удалить
  системную английскую, удалить японскую;
- добавить вьетнамскую раскладку Simple Telex, удалить английскую, удалить
  вьетнамскую.

©
[Вопросы о типографской раскладке Ильи Бирмана](https://ilyabirman.ru/typography-layout/faq/)

> Пришлось несколько раз хаотично добавлять разные раскладки: английские
> и Simple Telex, чтобы в стандартных приложениях заработала английская
> раскладка Ильи Бирмана 🤷‍♂️ Русская работала сразу.

### Сторонняя мышь с нормальной прокруткой

Если нужно использовать мышь не от Apple,
то [приложение Mos](https://mos.caldis.me/) сделает приятную прокрутку,
в которой можно менять направление, шаг и плавность. По-умолчанию в macOS
не удобная прокрутка для мышей всех производителей, кроме Apple 🥲
[После попытки открыть приложение Mos в течение часа запуск программы необходимо разрешить](https://support.apple.com/guide/mac-help/open-a-mac-app-from-an-unidentified-developer-mh40616/mac)
в меню «Системные настройки», нажмите «Защита и безопасность», перейдите
в раздел «Основные» и нажмите кнопку «Подтвердить вход».

```sh
# Установка Mos
brew install --cask mos
```

### Управление расположением окон

Быстрое переключение окна на пол экрана, на другой монитор.

- [Rectangle](https://rectangleapp.com/) с открытым исходным кодом 🔥 можно
  мышью «примагничивать» к краям экрана
- [Amethyst](https://ianyh.com/amethyst/) с открытым исходным кодом
- [Magnet](https://magnet.crowdcafe.com/) платная

```sh
# Установка Rectangle
brew install --cask rectangle
```

### KVM

Использование одной клавиатуры и мыши для работы на разных компьютерах.

- [Universal Control от Apple](https://support.apple.com/HT212757) — работает
  для Mac и iPad, нужен одинаковый Apple ID на всех устройствах.
- [Teleport](https://github.com/johndbritton/teleport) — лучший KVM
  для macOS-устройств: на теркпаде работают жесты, плавная прокрутка страниц,
  курсор без тормозов.
- [Barrier](https://github.com/debauchee/barrier) — кроссплатформенный KVM между
  macOS, Linux, Windows. Между двумя macOS на клиенте странная прокрутка
  и не работают: буквы «б» и «ю» для русской раскладки; жесты трекпада, например
  переключение между пространствами (четыре пальца влево/вправо).
- [KeyPad](https://bluetooth-keyboard.com/) можно любую клавиатуру и мышь вашего
  компьютера подключить к другому устройству по Bluetooth. На macOS
  устройстве-потребителе: не работали системные сочетания клавиш, например
  Spotlight (Cmd + Space); у мыши плохая прокрутка страниц.

```sh
# Установка Teleport
brew install --cask abyssoft-teleport
```

### Zsh

Обновление zsh не нужно, на macOS 12 установлена современная версия 5.8. Команда
для проверки `zsh --version`.

```sh
# Установка автодополнений команд
brew install zsh-completions

# Включить автодополнение команд
cat <<EOT >> .zshrc
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
EOT

# Команда `compaudit` выводит список необходимых папок для следующей команды,
# которая убирает при каждом запуске терминала сообщение
# `zsh compinit: insecure directories, run compaudit for list`
chmod -R go-w '/opt/homebrew/share'
```

### Starship

```sh
# Установка Starship
brew install starship

# Установка шрифта для Starship
brew tap homebrew/cask-fonts         # You only need to do this once!
brew install font-jetbrains-mono-nerd-font # or another from list `brew search nerd-font`
# В своём терминале (Terminal, iTerm) в настройках выбирите установленный шрифт, иначе будут проблемы с отображением некоторых символов в Starship

# Использование Starship в Zsh
echo 'eval "$(starship init zsh)"' >> .zshrc

# Принять изменение окружения в текущей сессии
source ~/.zshrc
```

### SSH

> todo:
>
> - генерация новых ключей `ssh-keygen`
> - использование старых
> - использование на гитхабе
> - ssh-add для паролей
> - копирование открытого ключа через pbcopy `cat ~/.ssh/id_rsa.pub | pbcopy`

## Node.js

> Для управления версиями Node.js можно использовать
> [asdf](https://asdf-vm.com/), как универсальный менеджер версий для множества
> языков программирования. В нём нет поддержки Python и Go,
> [поддержка Rust только от сообщества](https://github.com/asdf-community/asdf-rust)
> с 30 звёздами на GitHub.
>
> В итоге для Python использую [Poetry](https://python-poetry.org/),
> для Node.js — [N](https://github.com/tj/n). Для других языков не пользуюсь
> менеджерами версий.

```sh
# Установка менеджера версий Node.js
# https://github.com/mklement0/n-install
curl -L https://git.io/n-install | bash

# Принять изменение окружения в текущей сессии
source ~/.zshrc

# Установка Node.js последней версии LTS
n lts

# Установка Yarn
npm i -g yarn
```

## VS Code

### Расширения

#### Установка через терминал

```sh
# Установка расширения prettier для форматирования кода
code --install-extension esbenp.prettier-vscode

# Установка расширения code-spell-checker для правописания
# https://cspell.org/
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-russian
```

#### Рекомендация полезных расширений в проектах

В проектах можно размещать файл `.vscode/extensions.json`, чтобы рекомендовать
участникам проекта использовать полезные расширения в VS Code.

```json
{
  "recommendations": [
    "GraphQL.vscode-graphql",
    "styled-components.vscode-styled-components"
  ]
}
```

> todo: написать про оптимизацию: разные расширения для разных проектов

### Настройки

`~/Library/Application Support/Code/User/settings.json`

```json
{
  "terminal.integrated.fontFamily": "JetBrainsMono Nerd Font",
  "files.insertFinalNewline": true,
  "editor.tabSize": 2,
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.organizeImports": true,
    "source.fixAll": false
  }
}
```

### Горячие клавиши

`~/Library/Application Support/Code/User/keybindings.json`

```json
// Place your key bindings in this file to override the defaults
[
  {
    // Быстрое создание терминалов и переключение между ними
    "key": "alt+`",
    "command": "workbench.action.quickOpenTerm"
  }
]
```

## VPN Server

- [Tailscale](https://tailscale.com/) для организации сети между своими
  устройствами.
- [wireguard-install](https://github.com/Nyr/wireguard-install) — установка
  VPN-сервера Wireguard на Linux и управление пользователями.

```sh
# Установка WireGuard
wget https://git.io/wireguard -O wireguard-install.sh && bash wireguard-install.sh
```

## Git

### Auto Commit Message

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
