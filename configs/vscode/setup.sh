#!/bin/sh


# FIXME: configure vscode settings 
# macOS $HOME/Library/Application Support/Code/User/settings.json
# Linux $HOME/.config/Code/User/settings.json
code_path="$HOME/Library/Application Support/Code/User"

if [ -d "$code_path" ]; then
	ln -sfn ./settings.json "$code_path/settings.json"
fi
# install extensions
cat ./extensions | while read line
do 
	code --install-extension $line
done


