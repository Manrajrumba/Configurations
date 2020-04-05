syntax on				" Enable syntax processing
set t_Co=256			" Set terminal colors to 256 bits
colorscheme onehalfdark "My Modified OneHalfDark Theme
set number				" Show line numbers
set showcmd				" Show last command in bottom bar
set showmatch			" Highlight matching [{()}]
set hlsearch			" Highlight matches
set visualbell			" Flash the screen instead of beeping on errors
set ts=4 sw=4			" Set tab and shift to 4 spaces
set cursorline			" Highlight current line
hi clear CursorLine
hi CursorLine gui=underline cterm=underline	 
set title				" Enable mouse for scrolling and resizing
set mouse=a				" Set the window’s title to the file currently being edited
nmap <C-n> :NERDTreeToggle<CR>	" Set Ctrl + N to toggle NerdTee
