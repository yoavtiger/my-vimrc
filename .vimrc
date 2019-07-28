set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" more Plugin commands
" ...
call vundle#end()            " required
filetype plugin indent on    " required

" vim settings:
set number
set relativenumber
set updatetime=250
set vb
set shell=/bin/bash
" plugins:
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mhinz/vim-signify'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'moll/vim-node'
Plugin 'mitermayer/vim-prettier'
Plugin 'thaerkh/vim-workspace'
Plugin 'danro/rename.vim'
Plugin 'w0rp/ale'
Plugin 'janko-m/vim-test'
Plugin 'jgdavey/tslime.vim'

" js autocomplete:
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'marijnh/tern_for_vim'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'epeli/slimux'

"ts plugins:
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

" python
Plugin 'zchee/deoplete-jedi'
Plugin 'jmcantrell/vim-virtualenv'

"spaces instead of tabs
set tabstop=4
set shiftwidth=4
set softtabstop=0 
set expandtab

"enable deoplete
let g:deoplete#enable_at_startup = 1
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]


" shortcuts:

map <C-n> :NERDTreeToggle<CR>
map <leader>d :TernDef<cr>
map <S-F6> :TernRename<cr>
map <leader>r :TernRefs<cr>
autocmd FileType typescript map  <leader>d :TsuDefinition
map <leader>l :CtrlPMRU<cr>
map <leader>q :%!python -m json.tool<cr>
" copy file name
map <leader>% :!echo %:p \| pbcopy <cr>

"git shortcuts
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>ga :Gwrite<cr>
map <leader>gr :Gread<cr>
map <leader>gb :Gblame<cr>

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let test#strategy = "tslime"
"wrokspace settings:
let g:workspace_autosave_always = 1


"ctrlp settings:

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --path-to-ignore ~/.ignore'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"solarized colorschems
syntax enable
if has('gui_running')
    set background=dark
endif
let g:solarized_termcolors=256
colorscheme solarized

"ack settings:
if executable('ag')
  let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ignore'
endif

autocmd FileType markdown setlocal spell
autocmd FileType js setlocal sw=2 sts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 et
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd FileType typescript setlocal sw=2 sts=2 et

"prettier settings:
let g:prettier#exec_cmd_path = "/Users/yoav/.nvm/versions/node/v6.9.2/bin/prettier"
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#tab_width = 2


command! WebRestart execute "!tmux send-keys -t test-envs:0.0 C-c Up Enter"
command! CorrRestart execute "!tmux send-keys -t test-envs:0.1 C-c Up Enter"
command! OrchRestart execute "!tmux send-keys -t test-envs:0.2 C-c Up Enter"
command! Orch2Restart execute "!tmux send-keys -t test-envs:0.3 C-c Up Enter"

command! Usage execute "Ack require.*%:t:r"
command! RunDev execute "!sh ~/run-scripts/run-dev-envs.sh"
command! RunTest execute "!sh ~/run-scripts/run-test-envs.sh"
command! RunFile execute "!tmux send-keys -t scratch:0.0 C-c node Space % Enter"

let @b = '/ a/*$%A*/'
let @z = '10@b'
let @c = '/*B€kbbefxX$%$xx'
let @x = '10@c'
