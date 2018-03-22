c_dir=$(pwd)
configs_dir_path="$c_dir/configs"

# link to user dir.
ln -f -s ${configs_dir_path}/zshenv $HOME/.zshenv
ln -sfnv ${configs_dir_path}/zsh $HOME/.zsh
ln -f -s ${configs_dir_path}/tigrc $HOME/.tigrc
ln -f -s ${configs_dir_path}/bash_ext $HOME/.bash_ext
ln -f -s ${configs_dir_path}/vim $HOME/.vim
ln -f -s ${configs_dir_path}/vimrc $HOME/.vimrc
ln -f -s ${configs_dir_path}/brewfile $HOME/.brewfile
ln -sf   ${configs_dir_path}/gitignore $HOME/.gitignore

# install homebrew
if [ $L_OSTYPE="Darwin" ]; then 
 type brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# import git-prompt
if [ ! -e "$HOME/.git-prompt.sh" ]; then
	curl --insecure "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" > ~/.git-prompt.sh
fi

