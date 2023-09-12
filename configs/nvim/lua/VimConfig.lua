vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
--vim.opt.cursorline = true
vim.opt.scrolloff = 999

vim.opt.mouse = "a"
--vim.opt.background = 'dark'

--vim.g.coq_settings.xdg = true;

vim.cmd("colorscheme nord")
vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("let g:neoformat_try_node_exe = 1")

vim.cmd[[
function InkDraw()
	let name = expand('<cword>')
	let fullname = getcwd() . "/" . name . ".svg"
	let fullnameTrim = getcwd() . "/" . name
	silent execute "normal! diwo\\begin{figure}[ht]\<cr>\\def\\svgscale{0.3}\<cr>\\centering\<cr>\\input{" . name . ".pdf_tex}\<cr>\\end{figure}\<cr>\<esc>"
	silent execute "!inkNew " . getcwd() . " " . name . " >/dev/null 2>&1 &"
endfunction

function InkEdit()
	let name = expand('<cword>')
	let fullname = getcwd() . "/" . name . ".svg"
	let fullnameTrim = getcwd() . "/" . name
	silent execute "!inkEdit " . getcwd() . " " . name . " >/dev/null 2>&1 &"
endfunction
]]


vim.cmd[[
    let mapleader = ","
    set splitright
    noremap <M-1> 1gt
    noremap <M-2> 2gt
    noremap <M-3> 3gt
    noremap <M-4> 4gt
    noremap <M-5> 5gt
    noremap <M-6> 6gt
    noremap <M-7> 7gt
    noremap <M-8> 8gt
    noremap <M-9> 9gt
    noremap <M-0> :tablast<cr>

    nnoremap <C-S-tab> :tabprevious<CR>
    nnoremap <C-tab>   :tabnext<CR>
    nnoremap <C-t>     :tabnew<CR>
    inoremap <C-S-tab> <Esc>:tabprevious<CR>i
    inoremap <C-tab>   <Esc>:tabnext<CR>i
    inoremap <C-t>     <Esc>:tabnew<CR>

    nnoremap <Leader>f :Neoformat<cr>
    inoremap <Leader>f <Esc>:Neoformat<cr>a
    
    noremap \| :vsplit<CR>
    noremap - :split<CR>

    " <Leader>s to open current file stylesheet in new split
    nnoremap <Leader>s 
    nnoremap <Leader>s :vsp <C-R>=expand("%:p:h") . "/" . matchstr(expand("%:t:r"), '^\(.*\)\(\.spec\)*$') . ".module.scss"<CR>


    nnoremap <c-c> i\chord{}<ESC>i
    nnoremap <F5> o\begin{strofa}<ESC>o\end{strofa}<ESC>k
    nnoremap <F6> o\begin{refren}<ESC>o\end{refren}<ESC>k
    nnoremap <F7> o\begin{bridge}<ESC>o\end{bridge}<ESC>k
    nnoremap <F8> o\begin{solo}<ESC>o\end{solo}<ESC>k
]]
