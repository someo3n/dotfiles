alias x='startx'

alias gcl='git clone'
alias gcls='git clone --depth=1'

alias p='sudo pacman'
alias sc='sudo systemctl'
alias sl='sudo lf'

alias sv='sudo nvim'
alias nv='nvim'
alias nf='clear && neofetch'

alias ls='lsd --almost-all -l'
alias lst='ls --tree'
alias grep='grep --color=auto'

alias yay='paru'
alias yeet='paru -Rcs'

alias tm='tmux'
alias tmls='tmux ls'
alias tmka='tmux kill-server'

tma() {
	if [ -z "$1" ]; then
		tmux attach
	else
		tmux attach -t "$1"
	fi
}

tmk() {
	if [ -z "$1" ]; then
		tmux kill-session
	else
		tmux kill-session -t "$1"
	fi
}

mkd() {
	mkdir -p "$@" && cd "$@"
}

lfcd() {
    tmpfile="$(mktemp)"
    lf -last-dir-path="$tmpfile" "$@"
    if [ -f "$tmpfile" ]; then
        dir="$(cat "$tmpfile")"
        rm -f "$tmpfile"
        if [ -d "$dir" ]; then
            cd "$dir"
        fi
    fi
}

