c_dir=$(pwd)

# link to user dir.
ln -f -s ${c_dir}/vimrc $HOME/.vimrc
ln -f -s ${c_dir}/bash_profile $HOME/.bash_profile
ln -f -s ${c_dir}/zshrc $HOME/.zshrc
ln -f -s ${c_dir}/tigrc $HOME/.tigrc
ln -f -s ${c_dir}/bash_ext $HOME/.bash_ext

# import git-prompt
if [ ! -e "$HOME/.git-prompt.sh" ]; then
	curl --insecure "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" > ~/.git-prompt.sh
fi

#source $HOME/.bash_profile
