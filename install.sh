#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}" || exit
stow -S */ --adopt

if [ ! -d "${HOME}/.mozilla/firefox" ]; then
	firefox -headless & disown
	sleep 1
	killall firefox
fi

FIREFOX_DIR=$(find ${HOME}/.mozilla/firefox/ -type d -regex ".*default-release$")
stow -S firefox --target="${FIREFOX_DIR}"

cd - > /dev/null || exit
