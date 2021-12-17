#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#    exec startx
#fi
if [ -z "${XDG_RUNTIME_DIR}" ] ; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! [ -d "${XDG_RUNTIME_DIR}" ] ; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

if [ -e /etc/arch-release ] ; then
#   for arch linux
    if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
#        [ -x /usr/bin/sway ] && exec sway
        startx
    fi
elif [ -e /etc/gentoo-release ] ; then
#   for gentoo linux
    export LIBSEAT_BACKEND=logind
    if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
        [ -x /usr/bin/sway ] && exec dbus-run-session sway
    fi
fi
