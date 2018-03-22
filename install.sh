c_dir=$(pwd)

# link to user dir.
ln -f -s ${c_dir}/zshenv $HOME/.zshenv
ln -sfnv ${c_dir}/zsh $HOME/.zsh
ln -f -s ${c_dir}/tigrc $HOME/.tigrc
ln -f -s ${c_dir}/bash_ext $HOME/.bash_ext
ln -f -s ${c_dir}/vim $HOME/.vim
ln -f -s ${c_dir}/vimrc $HOME/.vimrc
ln -f -s ${c_dir}/brewfile $HOME/.brewfile
ln -sf  ${c_dir}/gitignore $HOME/.gitignore

# install homebre
if [ $L_OSTYPE="Darwin" ]; then 
 type brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# import git-prompt
if [ ! -e "$HOME/.git-prompt.sh" ]; then
	curl --insecure "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" > ~/.git-prompt.sh
fi

