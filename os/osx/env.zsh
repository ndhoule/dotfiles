# TODO: Load this file conditionally, based on OS
# TODO: DRY this up
if [[ -x /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ]]; then
  export CHROME_BIN=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
fi

if [[ -x $HOME/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ]]; then
  export CHROME_BIN=$HOME/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
fi

if [[ -x /Applications/Firefox.app/Contents/MacOS/firefox-bin ]]; then
  export FIREFOX_BIN=/Applications/Firefox.app/Contents/MacOS/firefox-bin
fi

if [[ -x $HOME/Applications/Firefox.app/Contents/MacOS/firefox-bin ]]; then
  export FIREFOX_BIN=$HOME/Applications/Firefox.app/Contents/MacOS/firefox-bin
fi
