#!/bin/sh

DEB_STD_PATH='/usr/share/games/fortunes'

if [ -d "${1}" ]; then
  FORTUNES_PATH=$1
elif [ -d "${DEB_STD_PATH}" ]; then
  FORTUNES_PATH=$DEB_STD_PATH
else
  echo "Directory $FORTUNES_PATH does not exist."
  unset FORTUNES_PATH
fi

if [ $FORTUNES_PATH ]; then
  strfile buffy
  if [ $? = 0 ]; then
    sudo cp buffy "${FORTUNES_PATH}"
    sudo cp buffy buffy.dat "${FORTUNES_PATH}"
    sudo ln -s "${FORTUNES_PATH}"/buffy "${FORTUNES_PATH}"/buffy.u8
    echo "Installed to $FORTUNES_PATH"
  fi
fi

echo "\n\n"
fortune buffy
