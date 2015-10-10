setlocal tabstop=2
setlocal shiftwidth=2

if exists('g:loaded_vimrubocop')
    noremap <leader>r :RuboCop<CR>
endif
