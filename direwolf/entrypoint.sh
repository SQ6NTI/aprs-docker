#!/bin/sh
set -e

if [ -n "$TZ" ]; then
    echo "Setting timezone to $TZ"
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    echo "$TZ" > /etc/timezone
fi

CONFIG_FILE="${CUSTOM_CONFIG:-/etc/direwolf/direwolf.conf}"

echo "Checking Direwolf config: $CONFIG_FILE"

if [ ! -e "$CONFIG_FILE" ]; then
    echo "ERROR: Config file does not exist: $CONFIG_FILE"
    exit 1
fi

if [ ! -r "$CONFIG_FILE" ]; then
    echo "ERROR: Config file is not readable: $CONFIG_FILE"
    exit 1
fi

if [ ! -s "$CONFIG_FILE" ]; then
    echo "ERROR: Config file is empty (zero size): $CONFIG_FILE"
    exit 1
fi

echo "Config file OK — starting Direwolf"

if [ "$1" = "direwolf" ]; then
    case " $* " in
        *" -c "*) : ;;
        *)
            set -- direwolf -c "$CONFIG_FILE" "$@"
            ;;
    esac
fi

exec "$@"
