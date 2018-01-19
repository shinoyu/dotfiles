c_dir=$(pwd)

# link to user dir.
ln -f -s ${c_dir}/bash_profile $HOME/.bash_profile
ln -f -s ${c_dir}/zshenv $HOME/.zshenv
ln -sfnv ${c_dir}/zsh $HOME/.zsh
ln -f -s ${c_dir}/tigrc $HOME/.tigrc
ln -f -s ${c_dir}/bash_ext $HOME/.bash_ext
ln -f -s ${c_dir}/vim $HOME/.vim
ln -f -s ${c_dir}/vimrc $HOME/.vimrc
ln -f -s ${c_dir}/brewfile $HOME/.brewfile

# import git-prompt
if [ ! -e "$HOME/.git-prompt.sh" ]; then
	curl --insecure "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" > ~/.git-prompt.sh
fi

