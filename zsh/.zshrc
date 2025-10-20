export ZSH="$HOME/.oh-my-zsh"
plugins=(git laravel5 composer pip python sudo)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH=$HOME/.emacs.d/bin:/home/artin/.local/share/gem/ruby/3.4.0:~/.gems/3.4.0/bin:/usr/lib64/ruby/gems/3.4.0:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

ZSH_THEME="wedisagree"
path+="home/artin/.config/emacs/bin"
path+="/home/artin/.cargo/bin"
path+="/home/linuxbrew/.linuxbrew/bin"
export SHELL="/bin/zsh"

# VARIABLES ---------------------------------------------------------
export DOOMDIR="$HOME/.config/doom"
export EXPLORER="ranger"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE="qt5ct"



# EXPORTS ------------------------------------------------------------
export VSF="/home/artin/Vshrd"
export MUS="$VSF/music"
export SHS="$VSF/shell-scripts"
export MAC="$VSF/macros"
export SRC="$VSF/Sources"

# ALIASES ------------------------------------------------------------
alias doom='/home/artin/.config/emacs/bin/doom'
alias rang='. ranger'
alias dlp='yt-dlp -f "ba" -x --audio-format "mp3" --yes-playlist --add-metadata --write-info-json --windows-filenames --write-playlist-metafiles --write-thumbnail -o "%(playlist)s/%(playlist_index)s . %(title)s.%(ext)s" '
alias macro="bash /home/artin/Vshrd/shell-scripts/macros.sh"
alias cmus="cd $MUS/ && cmus"
alias mupdf="setsid mupdf"
# alias cbonsai="cbonsai -Sb 2 -w 1.00 -L 100 -M 15"
alias cbonsai="cbonsai -b 1 -L 60"
alias goto='cd && cd $(find . -type d -print | fzf)'
alias shs="bash $SHS/macros.sh"
alias nvimupdate="nvim --headless '+Lazy! sync' +qa"
alias agenda="bash /home/artin/Vshrd/shell-scripts/agenda.sh"
alias dlink="bash /home/artin/Vshrd/shell-scripts/dlink.sh"
alias journal="bash /home/artin/Vshrd/shell-scripts/journal.sh"
alias cppath="bash /home/artin/Vshrd/shell-scripts/cppath.sh"
alias lpc="bash /home/artin/Vshrd/shell-scripts/lppath.sh"
alias newmac="bash /home/artin/Vshrd/shell-scripts/new_macro.sh"
alias date="date '+%a %b %d %V %Y %H:%M'"
alias dooit="dooit --db /home/artin/Vshrd/Vault/General/agenda.db"
alias jlab="source /home/artin/Vshrd/Projects/004_Jupyter_Lab/jlab/bin/activate &&jupyter lab"
alias todo="bash /home/artin/Vshrd/shell-scripts/todo.sh $VSF"
alias twatch="setsid typst watch"

# SCRIPTS ------------------------------------------------------------
alias lm="lualatex"
alias lb="sh $SHS/compileWithBib.sh"
alias GCP="git add . && git commit -m 'Generic Message Version 4' && git push"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Created by `pipx` on 2025-06-08 10:37:34
export PATH="$PATH:/home/artin/.local/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/bin:$GOPATH/bin"
# bun completions
[ -s "/home/artin/.bun/_bun" ] && source "/home/artin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# yazi stuff
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# zoxide shii
eval "$(zoxide init zsh)"
