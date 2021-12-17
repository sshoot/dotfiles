# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

# End of lines added by compinstall

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
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export AUR_PAGER=ranger
    alias aur-vercmp='aur repo -d custom --list | aur vercmp'
fi

if [ $TERM = 'alacritty' ] ; then
    alias ssh='TERM=xterm-256color ssh'
fi

EDITOR=/usr/bin/vim

PROMPT='
%F{cyan}%n%f@%F{magenta}%m%f[%F{green}%~%f]
%# '
RPROMPT='%D %*'

# Settings for environmental variables
case $PATH in
    *"$HOME/.local/bin"*)
        ;;
    *)
        export PATH="$HOME/.local/bin:$PATH" ;;
esac

case $PATH in
    *"$HOME/.local/texlive/2021/bin/x86_64-linux"*)
        ;;
    *)
        export PATH="$PATH:$HOME/.local/texlive/2021/bin/x86_64-linux";;
esac

case $MANPATH in
    *"$HOME/.local/share/man"*)
        ;;
    *)
        export MANPATH="$MANPATH:$HOME/.local/share/man" ;;
esac

case $INFOPATH in
    *"$HOME/.local/share/info"*)
        ;;
    *)
        export INFOPATH="$INFOPATH:$HOME/.local/share/info" ;;
esac

#if [ $TERM != 'screen' ] && [ $TERM != 'tmux' ]; then
#    [ -x '/usr/bin/tmux' ] && tmux;
#fi
