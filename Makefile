all: install

install:
	echo "No default"

install-vim:
	@ln -sf `pwd`/vimrc ${HOME}/.vimrc
	@ln -sf `pwd`/vim/ ${HOME}/.vim
	@mkdir -p ${HOME}/bin
	@ln -sf `pwd`/bin/ack ${HOME}/bin
	@echo 'Put export PATH=$$HOME/bin:$$PATH in your *rc file'

install-git:
	@ln -sf `pwd`/gitconfig ${HOME}/.gitconfig

uninstall:
	echo "nothing yet"
