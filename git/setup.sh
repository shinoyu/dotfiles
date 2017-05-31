if type git >/dev/null 2>&1; then
	git config --global merge.tool vimdiff2
	git config --global mergetool.keepbackup false
fi
