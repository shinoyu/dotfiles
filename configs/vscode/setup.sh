#!/bin/sh


# FIXME: configure vscode settings 
# macOS $HOME/Library/Application Support/Code/User/settings.json
# Linux $HOME/.config/Code/User/settings.json

# install extensions
cat ./extensions | while read line
do 
	code --install-extension $line
done


