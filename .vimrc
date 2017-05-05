" Plugins
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
    Plugin 'tweekmonster/local-indent.vim'
    Plugin 'sjl/gundo.vim'
    Plugin 'airblade/vim-gitgutter'

  " required block for Vundle
    call vundle#end()
    filetype plugin indent on

" Settings for Plugins
  " Plugin 'altercation/vim-colors-solarized'
    syntax enable
    set background=light
    colorscheme solarized
    let g:solarized_termcolors=256

  " Plugin 'tweekmonster/local-indent.vim'
    autocmd FileType *.html,*.css,*.js,*.md,*.txt LocalIndentGuide +hl -cc
    hi LocalIndentGuide ctermfg=255 ctermbg=7 cterm=inverse

  " Plugin 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_min_count = 0
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#show_tab_nr = 1
    set laststatus=2

  " Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='solarized'

  " Plugin 'ctrlpvim/ctrlp.vim'
    set runtimepath^=~/.vim/bundle/ctrlp.vim

" Interface
  " Current line
    hi CursorLineNr ctermbg=7

  " Relative number — numbers of strings
    set rnu

  " Folding
    function! NeatFoldText()
      let line = ' ' . substitute(
            \ getline(v:foldstart),
            \ '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g'
            \ ) . ' '
      let lines_count = v:foldend - v:foldstart + 1
      let lines_count_text = '/ '
            \ . printf("%10s", lines_count . ' lines') . ' /'
      " let foldchar = matchstr(&fillchars, 'fold:\zs.')
      let foldchar = ' '
      let foldtextstart = strpart(
            \ '+' . repeat(' ', v:foldlevel*2-2) . line, 0, (winwidth(0)*2)/3)
      let foldtextend = lines_count_text . repeat(foldchar, 8)
      let foldtextlength = strlen(
            \ substitute(foldtextstart . foldtextend, '.', 'x', 'g')
            \ ) + &foldcolumn
      return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength)
            \ . foldtextend
    endfunction
    set foldtext=NeatFoldText()
    set foldmethod=indent
    set foldlevelstart=5
    hi Folded ctermbg=230 cterm=NONE term=NONE ctermfg=14

  " Number of column to be highlighted
  " Only available when compiled with the +syntax feature
    set colorcolumn=80


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
    set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:_

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

  " No wrap
    set nowrap

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


" Keymap
  " Clear the search highlight in Normal mode
    nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" AutoCMD
  autocmd BufWritePre * %s/\s\+$//e
