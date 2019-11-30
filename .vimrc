" F5 opens currently edited file at appropriate line and column inside vscode
map <F5> :execute '!code -g ' . shellescape(expand('%')) . ':' . line('.') . ':' . col('.') <enter>
