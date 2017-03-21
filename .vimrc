" Vundle
  " required block for Vundle
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    set shell=/bin/bash " fix bug https://git.io/vyKir

  " My Plugins
    Plugin 'vim-airline/vim-airline'
      Plugin 'vim-airline/vim-airline-themes'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'nathanaelkane/vim-indent-guides'

    " Disabled
      " Plugin 'vim-syntastic/syntastic'
      " Plugin 'rodnaph/vim-color-schemes'

  " required block for Vundle
    call vundle#end()
    filetype plugin indent on

" Settings for Plugins
  " Plugin 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_auto_colors = 1
    let g:indent_guides_guide_size = 1
    " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

  " Plugin 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1

  " Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='simple'

  " Plugin 'altercation/vim-colors-solarized'
    syntax enable
    set background=dark
    colorscheme solarized
    " let g:solarized_termcolors=256

  " Plugin 'ctrlpvim/ctrlp.vim'
    set runtimepath^=~/.vim/bundle/ctrlp.vim

" Interface
  " fold based on the indentation
    set foldmethod=indent

  " Syntax On
    syntax on

  " Number of column to be highlighted
  " Only available when compiled with the +syntax feature
    set colorcolumn=80
    highlight ColorColumn ctermbg=0

    " if version >= 703
    "   set colorcolumn=80
    " end

  " Copy indent from current line when starting a new line
    set autoindent

  " Character encoding used inside Vim
  " Only available when compiled with the +multi_byte feature
    set encoding=utf-8

  " Character encodings considered when starting to edit an existing file
  " Only available when compiled with the +multi_byte feature
    set fileencodings=utf-8,cp1251

  " Always add lf in the end of file
    set fileformat=unix

  " Show (partial) command in the last line of the screen
  " Comment this line if your terminal is slow
  " Only available when compiled with the +cmdline_info feature
    set showcmd

  " Minimal number of lines to scroll when cursor gets off the screen
  " set scrolljump=5
  " Minimal number of lines to keep above and below the cursor
  " Typewriter mode = keep current line in the center
    set scrolloff=999

  " Always show tabs
  " set showtabline=2
  " Display invisible characters
    set list
    if version >= 700
        set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
    else
        set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
    endif

  " Copy indent from current line when starting a new line
    set autoindent

  " Do smart indenting when starting a new line
  " Only available when compiled with the +smartindent feature
    set smartindent

  " Number of spaces to use for each step of (auto)indent
    set shiftwidth=2

  " Use spaces instead of tab
    set expandtab

  " Number of spaces that a tab counts for
    set tabstop=2

  " Number of spaces that a tab counts for while performing editing operations
    set softtabstop=2

  " Search
    " While typing a search command, show pattern matches as it is typed
    " Only available when compiled with the +extra_search feature
      set incsearch

    " When there is a previous search pattern, highlight all its matches
    " Only available when compiled with the +extra_search feature
      set hlsearch

    " Ignore case in search patterns
      set ignorecase

    " Override the 'ignorecase'
    " if the search pattern contains upper case characters
      set smartcase

    " All matches in a line are substituted instead of one
      set gdefault

    " No wrap
      set nowrap

" Keymap
  " Clear the search highlight in Normal mode
    nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" AutoCMD
  autocmd BufWritePre * %s/\s\+$//e
