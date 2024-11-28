" `7MN.   `7MF'`7MM"""YMM    .g8""8q.`7MMF'   `7MF'`7MMF'`7MMM.     ,MMF'
"   MMN.    M    MM    `7  .dP'    `YM.`MA     ,V    MM    MMMb    dPMM  
"   M YMb   M    MM   d    dM'      `MM VM:   ,V     MM    M YM   ,M MM  
"   M  `MN. M    MMmmMM    MM        MM  MM.  M'     MM    M  Mb  M' MM  
"   M   `MM.M    MM   Y  , MM.      ,MP  `MM A'      MM    M  YM.P'  MM  
"   M     YMM    MM     ,M `Mb.    ,dP'   :MM;       MM    M  `YM'   MM  
" .JML.    YM  .JMMmmmmMMM   `"bmmd"'      VF      .JMML..JML. `'  .JMML.

"=========================================================================
" Auto load for first time uses {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
"}}}
"=========================================================================
" Set undofiles, backups and swapfiles {{{
set undofile
set undolevels=1000                         " How many undos
set undoreload=10000                        " number of lines to save for undo
set backup                                  " enable backups
set swapfile                                " enable swaps
set undodir=$HOME/.config/nvim/tmp/undo     " undo files
set backupdir=$HOME/.config/nvim/tmp/backup " backups
set directory=$HOME/.config/nvim/tmp/swap   " swap files
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END
"}}}
"=========================================================================
" Basic settings {{{
set hlsearch
set nowrap
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set viminfo='1000,f1,<500
set mouse=n
set mousemodel=extend
set encoding=UTF-8
set ignorecase
set smartcase
set lazyredraw
set scrolloff=5
set shiftround
set list
set listchars+=tab:>-,lead:.,leadmultispace:+---
packadd! matchit
" set nrformats+=alpha

"}}}
"=========================================================================
" Sessions {{{
" Auto-save and auto-load session files

" Function to save the session
function! SaveSession()
  " Check if a buffer is associated with a file
  if expand('%') != '' && !&modifiable
    return
  endif

  " Get the current file's directory and filename
  let l:filename = expand('%:p')
  let l:session_file = expand('%:p:h') . '/.' . expand('%:t') . '.session.vim'

  " Save the session to the session file
  execute 'mksession! ' . fnameescape(l:session_file)
endfunction

" Function to load the session
function! LoadSession()
  " Check if a buffer is associated with a file
  if expand('%') == ''
    return
  endif

  " Get the current file's directory and filename
  let l:filename = expand('%:p')
  let l:session_file = expand('%:p:h') . '/.' . expand('%:t') . '.session.vim'

  " Check if the session file exists
  if filereadable(l:session_file)
    execute 'source ' . fnameescape(l:session_file)
  endif
endfunction

" Auto-load the session when opening a file
" autocmd BufWritePost * call SaveSession()

" Auto-save the session when leaving a file
" autocmd BufReadPost * call LoadSession()

set sessionoptions-=options  " Don't save options
"
" fu! SaveSess()
"   execute 'mksession! ' . getcwd() . '/.session.vim'
" endfunction

" fu! RestoreSess()
"   if filereadable(getcwd() . '/.session.vim')
"     execute 'so ' . getcwd() . '/.session.vim'
"     if bufexists(1)
"       for l in range(1, bufnr('$'))
"         if bufwinnr(l) == -1
"           exec 'sbuffer ' . l
"         endif
"       endfor
"     endif
"   endif
" endfunction

" autocmd VimLeave * call SaveSess()
" autocmd VimEnter * nested call RestoreSess()
" }}}
"=========================================================================
" windows manager {{{
" Disable the default s key
nnoremap s <nop>
nnoremap ss "_xi
" Use f + arrow keys for moving the cursor around windows
nnoremap f<LEFT>  <C-w>h
nnoremap f<DOWN>  <C-w>j
nnoremap f<UP>    <C-w>k
nnoremap f<RIGHT> <C-w>l
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap s<Up>     :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap s<Down>   :set splitbelow<CR>:split<CR>
nnoremap s<Left>   :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap s<Right>  :set splitright<CR>:vsplit<CR>
" open the terminal at up (horizontal), down (horizontal), left (vertical), right (vertical)
nmap t<Up>     s<UP>:terminal<CR>:normal i<CR>
nmap t<Down>   s<Down>:terminal<CR>:normal i<CR>
nmap t<Left>   s<Left>:terminal<CR>:normal i<CR>
nmap t<Right>  s<Right>:terminal<CR>:normal i<CR>
" Place the two screens up and down
nnoremap sh <C-w>t<C-w>K
" Place the two screens side by side
nnoremap sv <C-w>t<C-w>H
" Rotate screens
nnoremap srh <C-w>b<C-w>K
nnoremap srv <C-w>b<C-w>H
" Switch two screens
nnoremap sx <C-w><C-x>
"}}}
"=========================================================================
" other maps {{{
" auto insert spaces after comma
inoremap , ,<space>

let g:mapleader=" "

" Edit init.vim quickly
nnoremap <LEADER>vv :tabnew ~/.config/nvim/init.vim<CR>
" Edit vimviki index quickly
nnoremap <LEADER>vt :tabnew ~/Documents/VimWiki/index.md<CR>
" toggle highlight search
let hlstate=0
nnoremap <silent><LEADER><CR> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>
" Copy to system clipboard and past
nnoremap Y "+y
vnoremap Y "+y
" Quick quit
cnoremap Q q!<CR>
nnoremap <C-S> :w<CR>
nnoremap <C-Q> :q<CR>
tnoremap <C-Q> <C-\><C-N>:q<CR>
tnoremap <C-H> <C-\><C-N>
" Quick format comma with a space after
nnoremap <LEADER>, :%s#,\(\S\)#, \1#g<CR>
" shortcuts
nnoremap <silent><F3> :call CompileRunGcc()<CR>
nnoremap <silent><F9> :NERDTreeToggle<CR>
nnoremap <silent><F10> :Vista!!<CR>

" Compile function
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		exec "!gcc % -o %< -lm"
		:sp
		:res -5
		term time ./%<
        normal i
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -5
        :term time ./%<
        normal i
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:res -5
		:term python3 %
        :normal i
	elseif &filetype == 'rust'
		set splitbelow
		:sp
		:res -5
        :term cargo run
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'vimwiki'
		exec "MarkdownPreview"
    elseif &filetype == 'tex'
        :VimtexCompile
	endif
endfunc
"}}}
"=========================================================================
" neovide {{{
if exists("g:neovide")
    set guifont=ComicShannsMono\ Nerd\ Font:h13
    let g:nerdtree_tabs_open_on_gui_startup=0
    let g:nerdtree_tabs_open_on_new_tab=0
    nnoremap <C-S-V> "+p
endif
"}}}
"=========================================================================
" Color configure {{{
let g:airline_theme='gruvbox'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey' 
" let g:gruvbox_improved_strings=1
colorscheme gruvbox

"Use 24-bit (true-color) mode in Vim/Neovim
set termguicolors

source ~/.config/nvim/current_theme.vim
syntax on

"}}}
"=========================================================================
" telescope {{{
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"}}}
"=========================================================================
" vimwiki {{{
let g:vimwiki_list = [{'path': '~/Documents/VimWiki', 'syntax': 'markdown', 'ext': '.md'}]

let g:mkdp_command_for_global = 1

function! OpenMarkdownPreview (url)
    silent execute "!google-chrome-stable --new-window " . a:url
    normal <CR>
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
"}}}
"=========================================================================
" vimtex {{{
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Display symbols in insert mode and hide in normal and visual mode
set concealcursor=nc

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","
"}}}
"=========================================================================
"" coc settings {{{
"" Assign the path of node
"" let g:coc_node_path='/home/bthxtly/.nvm/versions/node/v20.16.0/bin/node'

"" Make <C-l> to accept selected completion item or notify coc.nvim to format
"" <C-g>u breaks current undo, please make your own choice
"inoremap <silent><expr> <C-l> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
""}}}
"=========================================================================
" ultiSnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-m>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="tabdo"

" edit UltiSnips and back quickly
nnoremap <LEADER>u :UltiSnipsEdit<CR>
"}}}
"=========================================================================
" multi cursor {{{
let g:multi_cursor_use_default_mapping=1

function! Multiple_cursors_before()
  call AutoPairsToggle()
endfun

function! Multiple_cursors_after()
  call AutoPairsToggle()
endfun
"}}}
"=========================================================================
" tab settings {{{
nnoremap <silent> TT :tabnew<cr>
nnoremap <silent> TN :tabnext<cr>
nnoremap <silent> TP :tabprevious<cr>
nnoremap T1 1gt
nnoremap T2 2gt
nnoremap T3 3gt
nnoremap T4 4gt
nnoremap T5 5gt
nnoremap T6 6gt
nnoremap T7 7gt
nnoremap T8 8gt
nnoremap T9 9gt
"}}}
"=========================================================================
" easy align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
"=========================================================================
" other settings {{{
let g:NERDTreeQuitOnOpen=1
"}}}
"=========================================================================
" Plugs {{{
call plug#begin('~/.config/nvim/plugged')

" self describe
Plug 'tpope/vim-repeat'
" Plug 'jiangmiao/auto-pairs'
Plug 'altermo/ultimate-autopair.nvim'
Plug 'easymotion/vim-easymotion'
" Plug 'mbbill/undotree'

" alternative & improvement for tagbar
Plug 'liuchengxu/vista.vim'

" multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" comment codes
Plug 'tpope/vim-commentary'

" syntax check
" Plug 'dense-analysis/ale'

" deal with parantheses etc.
Plug 'tpope/vim-surround'

" auto select text object
" Plug 'gcmt/wildfire.vim'

" add new text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'thalesmello/vim-textobj-multiline-str'
Plug 'jeetsukumaran/vim-pythonsense'

" auto complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-tree/nvim-web-devicons'

" vim status bar
Plug 'vim-airline/vim-airline'

" align
Plug 'junegunn/vim-easy-align'

" show git information in doc
Plug 'airblade/vim-gitgutter'

" markdown preview
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" LaTex support
Plug 'lervag/vimtex'

" snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" personal notes
Plug 'vimwiki/vimwiki'

" " copilot
" Plug 'github/copilot.vim'

" Just for fun
Plug 'seandewar/killersheep.nvim'

" time the start time
Plug 'dstein64/vim-startuptime'

" debugger
Plug 'puremourning/vimspector'

" move function arguments
Plug 'AndrewRadev/sideways.vim'

" Perl module / CLI script 'ack'
" Plug 'mileszs/ack.vim'

" Gruvbox
Plug 'gruvbox-community/gruvbox'

" colorful parantheses
" Plug 'luochen1990/rainbow'
Plug 'HiPhish/rainbow-delimiters.nvim'

" vim syntax highlight
Plug 'ap/vim-css-color'
Plug 'Fymyte/rasi.vim'
Plug 'kmonad/kmonad-vim'
Plug 'Bthxtly/vim-kitty'
Plug 'Bthxtly/hyprland-vim-syntax'
Plug 'Yggdroot/indentLine'

" more syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('matveyt/neoclipo', {'type': 'opt'})

packadd! neoclip
lua require"neoclip":setup()
"}}}
"=========================================================================
" lua {{{
lua << EOF
--------------------------------------------------------------------------
    -- treesitter settings {{{
    require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        -- ensure_installed = { "c", "cpp", "vim", "markdown", "markdown_inline" },
        ensure_installed = all,

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        -- List of parsers to ignore installing (or "all")
        -- ignore_install = { "javascript" },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            -- disable = { "c", "rust" },
            -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
                end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
        },
    }
    -- }}}
--------------------------------------------------------------------------
    -- cmp settings {{{
    -- Set up nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
    snippet = {
        expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
    }, {
        { name = 'buffer' },
    })
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[ cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
        { name = 'git' },
        }, {
            { name = 'buffer' },
        })
        })
    require("cmp_git").setup() ]]-- 

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
        })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
        { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig').pyright.setup {
        capabilities = capabilities
    }
    require'lspconfig'.clangd.setup{}
    -- }}}
EOF
"}}}
"=========================================================================
" neovim {{{
" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
" vim:foldmethod=marker
" }}}
