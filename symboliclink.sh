dotfileDir=`dirname $0`
cd $HOME
ln -s ${dotfileDir}/.tigrc
ln -s ${dotfileDir}/.vimrc
ln -s ${dotfileDir}/.zshrc
ln -s ${dotfileDir}/.gitconfig
ln -s ${dotfileDir}/.tmux.conf
