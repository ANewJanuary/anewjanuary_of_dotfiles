### FISH OPTIONS ###
if status is-interactive
    # Specify the Zellij config directory

    # Check if our Terminal emulator is Ghostty
    # if [ "$TERM" = xterm-kitty ]
    # Launch zellij
    # zellij attach -c def0
    # eval (zellij setup --generate-auto-start fish | string collect)
    # end
end

set fish_greeting
function fish_mode_prompt
end

fish_config theme choose flexoki-light

# Enable vi mode

fish_vi_key_bindings

# Set cursor shape for different modes (requires terminal support)
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_visual block
set fish_cursor_replace_one underscore

# Or for blinking cursor (if supported):
set fish_cursor_default block blink
set fish_cursor_insert line blink

### FISHRC ###
# startup
~/Vshrd/shell-scripts/fortune.sh
# paths
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
set -gx PATH /usr/bin $PATH
set -gx PKG_CONFIG_PATH /usr/lib64/pkgconfig /usr/share/pkgconfig $PKG_CONFIG_PATH
fish_add_path ~/.emacs.d/bin
fish_add_path ~/.local/share/gem/ruby/3.4.0
fish_add_path ~/.gems/3.4.0/bin
fish_add_path /usr/lib64/ruby/gems/3.4.0
fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path /usr/local/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin
fish_add_path ~/.config/emacs/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/go/bin
fish_add_path /home/artin/st/stm32cubeclt_1.18.0/GNU-tools-for-STM32/bin

# aliases
alias dlp 'yt-dlp -f "ba" -x --audio-format "mp3" --yes-playlist --add-metadata --write-info-json --windows-filenames --write-playlist-metafiles --write-thumbnail -o "%(playlist)s/%(playlist_index)s . %(title)s.%(ext)s"'
alias macro 'bash /home/artin/Vshrd/shell-scripts/macros.sh'
alias cmus "cd /home/artin/Vshrd/music/; and command cmus"
alias mupdf 'setsid mupdf'
alias cbonsai 'cbonsai -b 1 -L 60'
alias shs 'bash $SHS/macros.sh'
alias cppath 'bash /home/artin/Vshrd/shell-scripts/cppath.sh'
alias lpc 'bash /home/artin/Vshrd/shell-scripts/lppath.sh'
alias newmac 'bash /home/artin/Vshrd/shell-scripts/new_macro.sh'
alias date 'date "+%a %b %d %V %Y %H:%M"'
alias todo 'bash /home/artin/Vshrd/shell-scripts/todo.sh $VSF'
alias twatch 'setsid typst watch'
alias syncconf 'bash /home/artin/Vshrd/shell-scripts/sync-config.sh'
alias lm lualatex
alias ld 'eza -1 -l -F --icons=always -b --no-permissions --no-time --no-user --total-size'
alias zel "zellij attach -c def1"
alias za "setsid zathura"
alias rnote "setsid rnote"
alias drawio "cd /home/artin/clones/drawio-desktop/ && setsid npm start && cd"

export FZF_DEFAULT_OPTS="--style=minimal --layout=reverse --height=40% --color='current-bg:#D4FF00,current-fg:#010200'"
export EDITOR="hx"

### FUNCTIONS ###
# zellij
set ZELLIJ_CONFIG_DIR "/home/artin/.config/zellij/"
set ZELLIJ_DISABLE_KITTY_KEYBOARD 1

# fzf
set -gx FZF_DEFAULT_COMMAND "fd \
    --type f --hidden --no-follow \
    --exclude .git \
    --exclude .steam \
    --exclude .local \
    --exclude .cargo \
    --exclude '/home/artin/Vshrd/music/**' \
    --exclude node_modules"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND "fd --type d --hidden --no-follow --exclude .git --exclude .steam"
fzf --fish | source

# Zoxide
zoxide init fish | source

# goto function - better Fish implementation
function goto
    cd && cd (find . -type d -print | fzf)
end

# ssh agent
function start_ssh_agent
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_rsa_gitlab
    ssh-add ~/.ssh/bremergygitea
    # if not ps -C ssh-agent >/dev/null
    # end
end

# timer using dunst
function timer
    bash ~/Vshrd/shell-scripts/timer.sh
end

# jlab function
function jlab
    source /home/artin/Vshrd/Projects/004_Jupyter_Lab/jlab/bin/activate
    and jupyter lab
end

# yazi function (ported from zsh)
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
