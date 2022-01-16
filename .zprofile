## Settings for environmental variables
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

## Runtime directory setting
if [ -z "${XDG_RUNTIME_DIR}" ] ; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! [ -d "${XDG_RUNTIME_DIR}" ] ; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

## Start window manager
if [ -e /etc/arch-release ] ; then
#   for arch linux
    if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
        export WLR_NO_HARDWARE_CURSORS=1
        [ -x /usr/bin/sway ] && exec sway
#        startx
    fi
elif [ -e /etc/gentoo-release ] ; then
#   for gentoo linux
    export LIBSEAT_BACKEND=logind
    if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
        [ -x /usr/bin/sway ] && exec dbus-run-session sway
    fi
fi
