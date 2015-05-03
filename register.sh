c_dir=$(pwd)

# link to user dir.
ln -s ${c_dir}/vimrc ~/.vimrc
ln -s ${c_dir}/bash_profile ~/.bash_profile
ln -s ${c_dir}/tigrc ~/.tigrc
ln -s ${c_dir}/bash_ext ~/.bash_ext

# import git-prompt
if [ ! -e "~/.git-prompt.sh" ]; then
	curl --insecure "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" > ~/.git-prompt.sh
fi

source ~/.bash_profile
