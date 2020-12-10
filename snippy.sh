#!/usr/bin/env bash
SNIPS=${DOTFILES}/snippets

cd ${SNIPS}

# Use the filenames in the snippy directory as menu entries.
# Get the menu selection from the user.
FILE=`find .  -type f | grep -v '^\.$' | sed 's!\.\/!!' | /usr/bin/rofi -dmenu`

if [ -f ${SNIPS}/${FILE} ]; then
  # Put the contents of the selected file into the paste buffer.
  # Strip the final byte which is a \n
  DATA=$([ -x "${SNIPS}/${FILE}" ] && bash "${SNIPS}/${FILE}" || head --bytes=-1 ${SNIPS}/${FILE})
  printf "${DATA}" | xsel -p -i
  printf "${DATA}" | xsel -b -i
  # Paste into the current application.
  xdotool key shift+Insert
fi
