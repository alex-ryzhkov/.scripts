#!/bin/sh

case "$(xset -q | grep -A 0 'LED' | cut -c 63)" in
  "0") layout="US" ;;
  "1") layout="RU" ;;
  *) layout="unknown" ;;
esac
echo $layout
