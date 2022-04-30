## Load .profile
source ~/.profile

## Load /etc/profile.d/*.sh
for i in /etc/profile.d/*.sh ; do
    [ -r $i ] && source $i
done

## Start window manager
if [ -e /etc/arch-release ] ; then
#   for arch linux
    if [ -z "${DISPLAY}" ]; then
        if [ "$(tty)" = "/dev/tty1" ]; then
            [ -x /usr/bin/sway ] && exec sway
        elif [ "$(tty)" = "/dev/tty2" ]; then
            exec startx
        fi
    fi
elif [ -e /etc/gentoo-release ] ; then
#   for gentoo linux
    export LIBSEAT_BACKEND=logind
    if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
        [ -x /usr/bin/sway ] && exec dbus-run-session sway
    fi
fi
