#!/bin/bash
set -e

echo "Installing dotfiles"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}" || exit
stow -S */ --adopt

# firefox files need specific installation
if [ -x "firefox" ]; then

	# create firefox dir if it doesn't exists
	if [ ! -d "${HOME}/.mozilla/firefox" ]; then
		firefox -headless 2>/dev/null & disown
		sleep 5
		killall firefox
	fi

	FIREFOX_DIR=$(find ${HOME}/.mozilla/firefox/ -type d -regex ".*default-release$")

	echo "Installing firefox config to ${FIREFOX_DIR}"
	stow -S firefox --target="${FIREFOX_DIR}"
fi

cd - > /dev/null || exit
