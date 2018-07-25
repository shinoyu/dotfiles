c_dir=$(pwd)
configs_dir_path="$c_dir/configs"

# link to user dir.
ln -sf  ${configs_dir_path}/zshenv $HOME/.zshenv
ln -sfn ${configs_dir_path}/zsh $HOME/.zsh
ln -sf  ${configs_dir_path}/tigrc $HOME/.tigrc
ln -sfn ${configs_dir_path}/bash_ext $HOME/.bash_ext
ln -sfn ${configs_dir_path}/vim $HOME/.vim
ln -sf  ${configs_dir_path}/vimrc $HOME/.vimrc
ln -sf  ${configs_dir_path}/tmux.conf $HOME/.tmux.conf
ln -sf  ${configs_dir_path}/tmux-reattach-to-user-namespace.conf $HOME/.tmux-reattach-to-user-namespace.conf
ln -sf  ${configs_dir_path}/brewfile $HOME/.brewfile
# git settings
sh "$configs_dir_path/git/setup.sh"

# link to user_bin.
ln -sfn ${c_dir}/tool/bin $HOME/bin

# install homebrew
if [ $L_OSTYPE="Darwin" ]; then 
 type brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# import git-prompt
if [ ! -e "$HOME/.git-prompt.sh" ]; then
	curl --insecure "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" > ~/.git-prompt.sh
fi

