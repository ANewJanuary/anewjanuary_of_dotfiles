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
alias twfe "$HOME/clones/2048/2048"
alias wallbg "$HOME/Vshrd/shell-scripts/wallbg.sh"
alias siv "$HOME/Vshrd/shell-scripts/svginvert.sh"

export FZF_DEFAULT_OPTS="--style=minimal --layout=reverse --height=40% --color='current-bg:#4c566a,current-fg:#f5f5f5'"
export EDITOR="hx"

### FUNCTIONS ###
# zellij
set ZELLIJ_CONFIG_DIR "/home/artin/.config/zellij/"
set ZELLIJ_DISABLE_KITTY_KEYBOARD 1

# fzf
set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
--color=fg:#c1c1c1,bg:#020000,hl:#974b46,gutter:#020000
--color=fg+:#c1c1c1,bg+:#000000,hl+:#974b46
--color=info:#505050,prompt:#974b46,pointer:#974b46
--color=marker:#999999,spinner:#999999,header:#999999"
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

# restart stuff
function restartaudio
    systemctl --user restart pipewire.service pipewire.socket pipewire-pulse.service pipewire-pulse.socket
end

function restartwifi
   bash $HOME/Vshrd/shell-scripts/restart_wifi.sh
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
    bash ~/Vshrd/shell-scripts/timer.sh $argv
end

# templates function
function template
  bash ~/Vshrd/shell-scripts/templates.sh
end

# jlab function
function jlab
    source /home/artin/Vshrd/Projects/004_Jupyter_Lab/jlab/bin/activate
    and jupyter lab
end

# diskey
function diskey
    sudo bash  ~/Vshrd/shell-scripts/diskey.sh
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

### COLOR SCHEME
# name: KHOLD colors for Fish
# url: https://fishshell.com/docs/current/index.html
# upstream: ${upstream}
# author: Andrea Schiavini (original code by Casey Miller)

# use in ~/.config/fish/conf.d/

# preferred bg: 000000
# alt background: 39121b

### Full palette. 
### Colors defined in neomdern/palette/KHOLD.lua
set -g alt 5f8787 
set -g constant aaaaaa 
set -g comment 505050 
set -g fg c1c1c1 
set -g func 888888 
set -g keyword 999999 
set -g number aaaaaa 
set -g operator 9b99a3 
set -g property c1c1c1 
set -g str eceee3 
set -g type 974b46 

# Syntax Highlighting Colors
set -g fish_color_normal c1c1c1
set -g fish_color_command 888888
set -g fish_color_keyword 999999
set -g fish_color_quote eceee3
set -g fish_color_redirection aaaaaa
set -g fish_color_end 9b99a3
set -g fish_color_error 5f8787
set -g fish_color_param c1c1c1
set -g fish_color_valid_path 974b46
set -g fish_color_option 5f8787
set -g fish_color_comment 505050
set -g fish_color_selection --background=000000
set -g fish_color_operator 9b99a3
set -g fish_color_escape 999999
set -g fish_color_autosuggestion 505050
set -g fish_color_cwd eceee3
set -g fish_color_hostname aaaaaa
set -g fish_color_status 5f8787
set -g fish_color_cancel aaaaaa
set -g fish_color_search_match --background=000000

# Completion Pager Colors
set -g fish_pager_color_progress 5f8787
set -g fish_pager_color_prefix 974b46
set -g fish_pager_color_completion c1c1c1
set -g fish_pager_color_description 505050
set -g fish_pager_color_selected_prefix 5f8787
set -g fish_pager_color_selected_completion 5f8787
set -g fish_pager_color_selected_background --background=000000
