set nocompatible

filetype off

let g:ackprg = "ag --nocolor --nogroup --column"

set encoding=utf-8 " Кодировка файлов по умолчанию
set relativenumber
set nu
set t_Co=256
set term=screen-256color

set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ +\ ':''}%*\ encoding\:\ %{&fileencoding}%=%c%V,%l\ %P\ [%n]

syntax on "Включить подсветку синтаксиса
colorscheme wombat256mod "Цветовая схема

set expandtab "Ставим табы пробелами
set tabstop=4
set softtabstop=4 "4 пробела в табе
set shiftwidth=4

set showcmd "отображение вводимой команды
set laststatus=2 "отображать статусную строку для каждого окна
set wildmenu "предлагать опции при табуляции

" режим вставки из буфера ОС, не портящий отступы
set pastetoggle=<F2>

" быстрый выход из режима вставки (не надо тянуться к Esc)
" заодно повесим на это действие сохранение
imap jk <Esc>:w<CR>

" сокращения для открытия новой вкладки
cnoreabbrev nt tabnew
cnoreabbrev tn tabnew

" подсвечивает все вхождения слова под курсором
"nmap <C-f> :set hlsearch<CR>#*

" перемещение в начало и конец строки одной клавишей
nnoremap 0 <S-$>
nnoremap 9 <S-^>

" поиск не учитывает регистр...
set ignorecase
" ...если только в поисковом паттерне нет букв в верхнем регистре
set smartcase
" поиск по мере ввода
set incsearch
set hlsearch "подсветка поиска

" выделение строки, на которой находится курсор, не нужно 
set cursorline
set cryptmethod=blowfish

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

set nojoinspaces
