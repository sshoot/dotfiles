if ! [ $0 = "./setup.sh" ] ; then
    return 1
fi

DOTFILESDIR="$PWD"

ln -s $DOTFILESDIR/.latexmkrc $HOME
ln -s $DOTFILESDIR/.tmux.conf $HOME
ln -s $DOTFILESDIR/.vimrc $HOME
ln -s $DOTFILESDIR/.zlogin $HOME
ln -s $DOTFILESDIR/.zshrc $HOME

if ! [ -e "$HOME/.config" ] && ! [ -d "$HOME/.config" ] ; then
    mkdir "$HOME/.config"
fi
ln -s $DOTFILESDIR/.config/alacritty $HOME/.config
ln -s $DOTFILESDIR/.config/i3 $HOME/.config
ln -s $DOTFILESDIR/.config/kitty $HOME/.config
ln -s $DOTFILESDIR/.config/mako $HOME/.config
ln -s $DOTFILESDIR/.config/matplotlib $HOME/.config
ln -s $DOTFILESDIR/.config/picom $HOME/.config
ln -s $DOTFILESDIR/.config/pipewire $HOME/.config
ln -s $DOTFILESDIR/.config/polybar $HOME/.config
ln -s $DOTFILESDIR/.config/sway $HOME/.config
ln -s $DOTFILESDIR/.config/waybar $HOME/.config
ln -s $DOTFILESDIR/.config/wofi $HOME/.config

if ! [ -e "$HOME/.config/vimb" ] && ! [ -d "$HOME/.config/vimb" ] ; then
    mkdir "$HOME/.config/vimb"
fi
ln -s $DOTFILESDIR/vimb/config $HOME/.config/vimb
