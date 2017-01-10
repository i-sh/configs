set nocompatible

filetype off

let g:ackprg = "ag --nocolor --nogroup --column"

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

"Плагин для vundle
Bundle 'gmarik/Vundle.vim'
"Плагин для гита
Bundle 'tpope/vim-fugitive'
"Плагин для http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'scrooloose/nerdtree'
"A plugin that allows for easy commenting of code for many filetypes.
Bundle 'scrooloose/nerdcommenter'
"Следит за PEP8
Bundle 'nvie/vim-flake8'
"поиск совпадений файлов
Bundle 'compview'
"ACK для vim
Bundle 'mileszs/ack.vim'
"Go для vim
Bundle 'fatih/vim-go'

" для flake8
let g:flake8_ignore="E501,E123,E124,E126,E127,E128"
let g:flake8_cmd="flake8"
" 201: extraneous whitespace around ([{,;:
" 202: same
" 251: whitespace around named parameter equals
" 261: two spaces before inline comment
" 501: line too long
" переход к следующему косяку в quickfix
map <C-n> <C-j>j<CR>

" \f - поиск с выводом списка вариантов, с перемещением по нему
map <leader>f <Plug>CompView

set encoding=utf-8 " Кодировка файлов по умолчанию
set number
set t_Co=256
set term=screen-256color
"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ +\ ':''}%*\ encoding\:\ %{&fileencoding}%=%c%V,%l\ %P\ [%n]
" статус-бар всегда виден:
set laststatus=2
" строка ярлычков вкладок всегда видна:
set showtabline=2

set guifont="Ubuntu Mono 10"
set guioptions=*

set expandtab "Ставим табы пробелами
set tabstop=4 
set softtabstop=4 "4 пробела в табе
set shiftwidth=4
set smarttab
"Автоотступ
set autoindent
" скроллить буфер, когда курсор подходит к верху/низу окна на scrolloff строк
set scrolloff=3
syntax on "Включить подсветку синтаксиса
colorscheme wombat256mod "Цветовая схема
" режим вставки из буфера ОС, не портящий отступы
set pastetoggle=<F2>

"" highlight trailing spaces
au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)

" редактор не реагирует на мышь
set mouse=
set wildignore=*.pyc,*.aux,*.o

" командой find можно искать и открывать файл в подкаталогах
set path=.,,**

"Настройка omnicomletion для Python (а так же для js, html и css)
autocmd FileType python set omnifunc=pythoncomplete#Complete

" редактирование и перезагрузка vimrc
nmap <leader>ve :tabnew ~/.vimrc<CR>
nmap <leader>vr :w<CR>:source ~/.vimrc<CR>

" быстрый выход из режима вставки (не надо тянуться к Esc)
" заодно повесим на это действие сохранение
imap jk <Esc>:w<CR>

" сокращения для открытия новой вкладки
cnoreabbrev nt tabnew
cnoreabbrev tn tabnew

" перемещение по словам в режиме вставки
imap <C-l> <C-Right>
imap <C-h> <C-Left>

nmap gr gT

" быстрая версия команд перемещения между сплитами
map <C-l> <C-W><Right>
map <C-h> <C-W><Left>
map <C-k> <C-W><Up>
map <C-j> <C-W><Down>

" \s делает source текущего файла
nmap <leader>s <Esc>:source %<CR>
" \w сохраняет текущий файл
nmap <leader>w <Esc>:w<CR>

" подсвечивает все вхождения слова под курсором
nmap <C-f> :set hlsearch<CR>#*

" изменение отступов строк как в казуальных редакторах
imap <S-Tab> <Esc><<i
nmap <S-Tab> <<
nmap <Tab> >>

" перемещение в начало и конец строки одной клавишей
nnoremap 0 <S-$>
nnoremap 9 <S-^>

" дублирование строки
nmap <C-d> <Esc>yyp
" закрытие окна
nmap <leader>q :q<CR>
" открытие файлового браузера
nmap <leader>n :NERDTreeToggle %:p:h<CR>

let NERDTreeIgnore=['\.o$', '\~$', '\.cmi$', '\.cmo$', '\.cmx$']

" переключение автопереносов строк
nmap <F10> <Esc>:set wrap!<CR>
" переключение нумерации
nmap <F11> <Esc>:set number!<CR>

" открытие терминала
nmap <leader>bt :ConqueTermTab bash<CR>
nmap <leader>bs :ConqueTermSplit bash<CR>
nmap <leader>bv :ConqueTermVSplit bash<CR>

" поиск не учитывает регистр...
set ignorecase
" ...если только в поисковом паттерне нет букв в верхнем регистре
set smartcase
" поиск по мере ввода
set incsearch

nmap <leader>gd :Gdiff<CR><C-h>
nmap <leader>gs :Gstatus<CR>
nmap <leader>dd <Esc>:diffoff<CR>:q<CR>

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
        au!
        au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

function! MouseAndNumbersToggle()
    set number!
endfunction

nnoremap <F12> :call MouseAndNumbersToggle()<CR>

" выделение строки, на которой находится курсор, не нужно 
set nocursorline

" Autocomplete on Tab ===================================
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

" шикарная фича: вставка с заменой текстового объекта
"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

com GOIndent :set tabstop=4| set shiftwidth=4| set noexpandtab
com PyIndent :set tabstop=4| set shiftwidth=4| set expandtab
autocmd BufNewFile *.go GOIndent
autocmd BufRead *.go GOIndent

"autocmd FileType go autocmd BufWritePre <buffer> Fmt
let g:gofmt_command = 'goimports'

autocmd BufNewFile *.py PyIndent
autocmd BufRead *.py PyIndent

imap C-e if err != nil {<CR>return err<CR>}

set cryptmethod=blowfish

"options for vim-go
let g:go_fmt_autosave = 0

nmap C-P :CtrlPMixed<CR>
nmap C-B :CtrlPBuffer<CR>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_custom_ignore = '.a$'

"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m':%s/\s\+$//e ''
"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set termencoding=utf-8 "Кодировка терминала
set novisualbell "Не мигать 
set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
"Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1

"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке, то будет использоваться cp1251


autocmd FileType python setlocal ts=4 sts=4 sw=4

autocmd FileType go compiler go

au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
