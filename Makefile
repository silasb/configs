all: install

install:
	echo "No default"

install-vim:
	ln -sf `pwd`/vimrc ${HOME}/.vimrc
	ln -sf `pwd`/vim/ ${HOME}/.vim

install-git:
	ln -sf `pwd`/gitconfig ${HOME}/.gitconfig

uninstall:
	echo "nothing yet"
