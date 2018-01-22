#!/bin/sh
c_dir=$(cd $(dirname $0) && pwd)

export_dir="$c_dir/.export"
if [ ! -d $export_dir ]; then
	mkdir -p $export_dir && echo "create export dir."
fi

secret_dir="$export_dir/secret"
if [ ! -d $secret_dir ]; then
	mkdir -p $secret_dir && echo "create export secret dir."
fi


# fetch .ssh_config
cp -r $HOME/.ssh "$secret_dir/.ssh"

# machine type's settings
if [ $L_OSTYPE="Darwin" ]; then
	echo "export app settings"

# krabiner
	/Applications/Karabiner.app/Contents/Library/bin/karabiner export > "$export_dir/karabiner-import.sh"

	# dash
	cp -f "$HOME/Library/Application Support/Dash/library.dash" "$export_dir/library.dash"

fi

# packaging
echo "input archive password."
read -s _pass

echo "reinput password."
read -s _repass
if [ $_pass = $_repass ]; then
	:
else
	echo "unmatch archive password."
	exit 1
fi

echo "start archive...."

zip -q -P "$_pass" -r export.zip .export/**

echo "finish!"

