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

" js autocomplete:
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'marijnh/tern_for_vim'
Plugin 'carlitux/deoplete-ternjs'

" python
Plugin 'zchee/deoplete-jedi'



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

"prettier settings:
let g:prettier#exec_cmd_path = "/Users/yoav/.nvm/versions/node/v6.9.2/bin/prettier"
let g:prettier#config#trailing_comma = 'es5'
