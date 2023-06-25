vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--vim.opt.cursorline = true
vim.opt.scrolloff = 999

vim.opt.mouse = "a"
vim.opt.background = 'dark'

--vim.g.coq_settings.xdg = true;

vim.cmd("let g:gruvbox_transparent_bg = 1")
vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("colorscheme gruvbox")

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
    
    noremap \| :vsplit<CR>

    nnoremap <c-c> i\chord{}<ESC>i
    nnoremap <F5> o\begin{strofa}<ESC>o\end{strofa}<ESC>k
    nnoremap <F6> o\begin{refren}<ESC>o\end{refren}<ESC>k
    nnoremap <F7> o\begin{bridge}<ESC>o\end{bridge}<ESC>k
    nnoremap <F8> o\begin{solo}<ESC>o\end{solo}<ESC>k
]]
