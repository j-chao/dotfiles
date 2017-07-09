" BASIC CONFIGURATIONS
" ================================================
    set nocompatible
    filetype plugin indent on        " load filetype-specific indent plugin/indent files
    set number                       " show line numbers
    syntax enable                    " enable syntax procesing
    set tabstop=4                    " number of visual spaces per TAB
    set shiftwidth=4
    set expandtab                    " tabs are spaces
    set showcmd                      " show command in bottom bar
    set cursorline                   " highlight current line
    set wildmenu                     " visual autocomplete for command menu
    set lazyredraw                   " redraw only when we need to
    set showmatch                    " highligh matching [{()}]
    set backspace=2                  " make backspace work like most other apps
    set scrolloff=20                 " maintain 20 lines top/bottom of selected line on screen

" SEARCHING OPTIONS
" ================================================ 
    set incsearch                     " incremental search, search as you type
    set ignorecase                     " ignore case when searching
    set smartcase                     " ignore case when searching lowercase
    set hlsearch                    " highlight search
    "command! -nargs=1 Nack Ack "<args>" $HOME/Documents/UT/YEAR6
    "nnoremap <leader>] :Nack
    let g:ctrlp_map = '<nul>'
    nnoremap <C-o> :CtrlP~/Documents/<CR>
    let g:ctrlp_working_path_mode = ''

" FOLDING OPTIONS
" ================================================
    set foldenable                    " enable folding
    set foldlevelstart=10            " open most folds by default
    set foldnestmax=10                " 10 nested fold max
    set foldmethod=indent            " fold based on indent level

" PARAGRAPH FORMATTING OPTIONS
" ================================================
    set textwidth=100                " set text witdth 
    set colorcolumn=+2              " set colored line at tw
    highlight ColorColumn ctermbg=7

" KEY MAPINGS
" =================================================
    nmap      <F2>            :NERDTreeToggle<CR>
    nmap      <F3>            :TagbarToggle<CR>
    nnoremap  <F4>            :GundoToggle<CR>
    nmap      <F5>            :setlocal spell! spelllang=en_us<CR>
    nmap      <F9>            gwap
    nnoremap  <leader><space> :nohlsearch<CR>

    " NOTES ===================================
        "command! -nargs=1 Ngrep lvimgrep "<args>" $HOME/Documents/UT/YEAR6/**/*.md      "taken from connermcd
        " nnoremap <leader>] :Ngrep 
        "nnoremap <C-n> :lne<cr>z
        " nnoremap <C-p> :lp<cr>z

    " SAVE FILE =============================== 
        inoremap <C-s> <ESC>:w<CR> 
        nnoremap <C-s> :w<CR>

    " VIM-SMOOTH-SCROLL =======================
        noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
        noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
        noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
        noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

    " VIM WINDOW MOVEMENT =====================
        noremap <C-h> <C-w>h
        noremap <C-j> <C-w>j
        noremap <C-k> <C-w>k
        noremap <C-l> <C-w>l

" GUNDO OPTIONS ===================================
    let g:gundo_return_on_revert=1 
    let g:gundo_preview_bottom=1

" SYNTASTIC OPTIONS
" =================================================
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

" VIM-TEX OPTIONS
" =================================================
    let g:vimtex_fold_enabled=1
    let g:vimtex_toc_enables=1

" YOUCOMPLETEME OPTIONS
" =================================================
    let g:ycm_server_python_interpreter = ''
    let g:ycm_key_list_select_completion = ['\<C-TAB>','\<DOWN>']
    let g:ycm_key_list_previous_completion = ['\<c-s-tab>','\<UP>']

" SUPERTAB OPTIONS
" ================================================
    let g:SuperTabDefaultCompletionType = '\<C-tab>'
        
" ULTISNIPS OPTIONS
" ================================================
    let g:UltiSnipsExpandTrigger       = "<leader><tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<c-w>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-q>"
    let g:UltiSnipsEditSplit           = "normal"             " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsSnippetDirectories  = ["UltiSnips", "vim-snippets"]
    let g:UltiSnipsSnippetsDir         = "~/.vim/my_snippets"
    let g:UltiSnipsUsePythonVersion    = 2

" STATUS LINE
" ================================================
    set laststatus=2                                " always show statusline
    let g:airline#extensions#tabline#enabled = 1    " show statusline for buffers
    let g:airline_powerline_fonts = 1               " allow powerline_fonts
    "let g:airline_theme = 'badwolf'

" CUSTOM FUNCTIONS
" ================================================
    " toggle between number and relative number
    function! ToggleNumber()
        if (&relativenumber == 1)
            set norelativenumber
            set number
        else
            set relativenumber
        endif
    endfunc

" PLUGINS USING VUNDLE
" =================================================
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'                   " plugin manager
    Plugin 'scrooloose/nerdcommenter'               " easy commenting
    Plugin 'scrooloose/nerdtree'                    " browse repo/directories
    Plugin 'scrooloose/syntastic'                   " syntax checking
    Plugin 'valloric/youcompleteme'                 " code completion engine
    Plugin 'rdnetto/YCM-Generator'                  " generate ycm config files
    Plugin 'ervandew/supertab'                      " customize <TAB> and prevent YCM vs UltiSnips
    "Plugin 'majutsushi/tagbar'                      " browse ctags
    Plugin 'altercation/solarized'                  " solarized color scheme
    Plugin 'altercation/vim-colors-solarized'       " templates for solarized
    Plugin 'vim-airline/vim-airline'                " status/tab line
    Plugin 'vim-airline/vim-airline-themes'         " templates for status/tab line
    "Plugin 'sjl/gundo.vim'                          " visualize undo tree
    Plugin 'godlygeek/tabular'                      " code alignment
    Plugin 'w0ng/vim-hybrid'                        " vim color scheme
    "Plugin 'lervag/vimtex'                          " for editing LaTeX files
    Plugin 'mileszs/ack.vim'                        " Ack, similar to grep
    Plugin 'ctrlpvim/ctrlp.vim'                     " fuzzy finder
    Plugin 'SirVer/ultisnips'                       " snippets engine
    Plugin 'honza/vim-snippets'                     " snippets
    Plugin 'tpope/vim-fugitive'                     " Git wrapper
    Plugin 'airblade/vim-gitgutter'                 " show git changes by left line numbers
    Plugin 'terryma/vim-smooth-scroll'              " smooth scrolling
    Plugin 'tpope/vim-surround'                     " functionality for (),'', etc.
    Plugin 'jiangmiao/auto-pairs'                   " autocompletion for (),'',etc.
    Plugin 'jelera/vim-javascript-syntax'           " plugin for javascript
    Plugin 'mattn/emmet-vim'                        " plugin for HTML
    Plugin 'suan/vim-instant-markdown'              " live preview of markdown files
    Plugin 'jaxbot/browserlink.vim'                 " live preview of HTML files
    call vundle#end()

" COLORSCHEME OPTIONS (w0ng/vim-hybrid) 
" =================================================
    set background=dark                             " background
    let g:hybrid_custom_term_colors = 1
    " let g:hybrid_reduced_contract = 1             " remove this line if using the default palette
    colorscheme koehler                             " vim colorscheme

" CLEAR VIM BUFFER ON EXIT
" ==================================================
    au VimLeave * :!clear:w
