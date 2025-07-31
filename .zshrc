# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

# End of lines added by compinstall

# Completin for sudo
# zstyle ':completion:*:sudo:*' environ PATH="$SUDO_PATH:$PATH"

#setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_expand
setopt inc_append_history

if [ -e /etc/gentoo-release ] ; then
    autoload -U compinit promptinit
    compinit
    promptinit; prompt gentoo
    export XMODIFIERS=@im=fcitx
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
elif [ -e /etc/arch-release ] ; then
    autoload -Uz compinit
    compinit
    alias aur-vercmp='aur repo -d custom --list | aur vercmp'
fi

alias cdvifm='cd $(vifm --choose-dir -)'
if [ $TERM = 'alacritty' ] || [ $TERM = 'xterm-kitty' ] ; then
    alias ssh='TERM=xterm-256color ssh'
fi

EDITOR=/usr/bin/vim

# vcs settings
autoload -Uz vcs_info
setopt prompt_subst
precmd_vcs_info () { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

PROMPT='
%F{cyan}%n[%y]%f@%F{magenta}%m%f[%F{green}%~%f]${vcs_info_msg_0_}
%(?..%B%F{red}%?%f%b )%# '
RPROMPT='%D %*'

function git () {
    if [[ $(pwd -P) == /mnt/c/* ]]; then
        "/mnt/c/Program Files/Git/cmd/git.exe" "$@"
    else
        /usr/bin/git "$@"
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
