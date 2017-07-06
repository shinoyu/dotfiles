DIR=$(cd $(dirname $0); pwd)

if type git >/dev/null 2>&1; then
	ln -sfnv $DIR/.gitignore $HOME/.gitignore
	ln -sfnv $DIR/.gitattributes $HOME/.gitattributes

	git config --global merge.tool vimdiff2
	git config --global mergetool.keepbackup false
	git config --global core.editor 'vim -c "set fenc=utf-8"'
	git config --global color.diff auto
	git config --global color.status auto
	git config --global color.branch auto
	git config --global core.excludesfile $HOME/.gitignore
else
	echo "\e[31mgitがインストールされていないかパスが通ってません\n確認してください\e[m"
fi


