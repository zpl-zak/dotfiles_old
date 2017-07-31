#!/bin/zsh

# Welcome message and prompt from:
# https://bbs.archlinux.org/viewtopic.php?pid=1215622#p1215622
#
# Welcome message
# logo taken from alsi command

# Plugins

plugins=(k)
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

c1="$(tput sgr0)$(tput setaf 4)"
c2="$(tput bold)$(tput setaf 4)"
c3="$(tput bold)$(tput setaf 7)"
echo
echo "        $c2,$c1                       _     _ _"
echo "       $c2/$c1#$c2\\$c1        __ _ _ __ ___| |__ | (_)_ __  _   ___  __"
echo "      $c2/$c1###$c2\\$c1      / _\` | '__/ __| '_ \\| | | '_ \\| | | \\ \\/ /"
echo "     $c2/$c1#####$c2\\$c1    | (_| | | | (__| | | | | | | | | |_| |>  <"
echo "    $c2/$c1##,-,##$c2\\$c1    \\__,_|_|  \\___|_| |_|_|_|_| |_|\\__,_/_/\\_\\"
echo "   $c2/$c1##(   )##$c2\\$c1"
echo "  $c2/$c1#.--   --.#$c2\\  $c3 A simple, elegant GNU/Linux distribution."
echo " $c2/$c1\`           \`$c2\\$(tput sgr0)"
echo "    $(tput setaf 2)zsh $ZSH_VERSION                   $(date +%a\ %d\/%m\/%y)$(tput sgr0)"
echo
fortune -a
echo
# Set the prompt
autoload -U colors && colors
#PS1="┌─┤%*│%{$fg_bold[green]%}%n%{$fg_no_bold[green]%}@%m:%{$fg_bold[blue]%}%~
#%{$reset_color%}└───╼ "
PS1="┭─┤%*│%{$fg_bold[green]%}%n%{$fg_bold[yellow]%}@%m:%{$fg_bold[blue]%}%~
%{$reset_color%}┵───╼ "
PS2="────╼ "
[ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(in ranger) '

export ZSH=$HOME/.oh-my-zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10240
SAVEHIST=10240000
setopt appendhistory
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/zaklaus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# User specific aliases and functions

#alias get_iplayer="get_iplayer --nopurge"
alias backuparch="sudo rsync -auvRh /home/ /media/backup/home"
alias boottime="systemd-analyze ; systemd-analyze blame"
alias cp="cp --reflink=auto"
alias flac="flac --keep-foreign-metadata"
alias grep="grep --colour=AUTO"
#alias hmhstream="mpc volume 24 ; amixer set Headphone 80 ; livestreamer http://www.twitch.tv/handmade_hero best ; amixer set Headphone 71 ; mpc volume 100"
alias ll="ls -lh"
alias logindownstairs="ssh zaklaus@archon64.lan"
alias logindownstairsX="ssh -X zaklaus@archon64.lan"
alias ls='ls --color=auto'
alias mirrorsupdate="sudo reflector -c 'Slovakia' --sort=score --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist"
alias mkdir="mkdir -p"
alias tree="tree -CA"
alias tt++="tt++ $HOME/.ttrc"

#export TERM="rxvt-unicode-256color"
if [ -n "$DISPLAY" ]; then
        export BROWSER="chromium"
else 
        export BROWSER="elinks"
fi
export EDITOR="vim"
export GREP_COLORS="ms=00;33:mc=00;33"
#export IPLAYER_OUTDIR="/home/zaklaus/Media/Videos/TV Programmes/iPlayer/"
export MANPAGER="/bin/zsh -c \"col -bx | vim -c 'set ft=man' -\"" #http://www.reddit.com/r/vim/comments/23u4ly/what_other_apps_are_vimlike/ch0ykcy
export PAGER="/bin/vimpager"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export SDL_AUDIODRIVER="alsa"
export WINEPREFIX="/home/zaklaus/.wine/"

# XDG Basedir http://standards.freedesktop.org/basedir-spec/latest/index.html
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"

set bell-style none

AUDIODRIVER=alsa
cdpath=(. ~ /home/zaklaus/Documents/creativewriting)

source /usr/share/doc/pkgfile/command-not-found.zsh
source /home/zaklaus/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=/home/zaklaus/bin:/home/zaklaus/4coder:/home/zaklaus/git/odin:$PATH

# From https://wiki.archlinux.org/index.php/Zsh#Key_Bindings
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
#[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
#[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
#
# History search keys from https://wiki.archlinux.org/index.php/Zsh#History_search
#
[[ -n "${key[Up]}"   ]]  && bindkey  "${key[Up]}"    history-search-backward
[[ -n "${key[Down]}" ]]  && bindkey  "${key[Down]}"  history-search-forward
#
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
        function zle-line-init ()
        {
                printf '%s' "${terminfo[smkx]}"
        }
        function zle-line-finish ()
        {
                printf '%s' "${terminfo[rmkx]}"
        }
        zle -N zle-line-init
        zle -N zle-line-finish
fi
# git
gita() { git add $1 && git status; }
alias gitp="git push"
alias gitpl="git pull"
alias gitom="git push origin master"
alias gitf="git fetch"
alias gits="git status"
alias gitch="git checkout $1"
alias gitd="git diff"
alias gitb="git branch"
alias gitr="git remote"
alias gitfc="gitf && gitch"

function gitc {
    git add .
    if [ -z "$1" ]; then
        echo -n "Enter commit message: "
        read msg
        echo -n "Enter commit desc: "
        read desc
        git commit -m $msg -m $desc
    else
        git commit -m $1
    fi
}

function gitcp {
    gitc $1 $2 && gitp;
}

alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset by %an' --abbrev-commit --date=relative"

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
lcd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias subl=subl3
alias tvb='mpv --ytdl-format="bestvideo+bestaudio/best" $1'
alias tvm='mpv --ytdl-format="bestvideo[height<=?720]+bestaudio/best" $1'
alias tvh='mpv --ytdl-format="bestvideo[height<=?480]+bestaudio/best" $1'
alias tvp='mpv --ytdl-format="bestvideo[height<=?360]+bestaudio/best" $1'
tvx(){mpv --ytdl-format="$1" $2;}
tvd(){youtube-dl -F $1;}

# easy transfer

# Merriam-Webster API keys
source $HOME/.mwebrc
