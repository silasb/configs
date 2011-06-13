all: install

install:
	echo "No default"

install-vim:
	rm -rfi ${HOME}/.vim
	@ln -sf `pwd`/vimrc ${HOME}/.vimrc
	@ln -sf `pwd`/vim/ ${HOME}/.vim
	@mkdir -p ${HOME}/bin
	@ln -sf `pwd`/bin/ack ${HOME}/bin
	@echo 'Put export PATH=$$HOME/bin:$$PATH in your *rc file'

install-git:
	@ln -sf `pwd`/gitconfig ${HOME}/.gitconfig

install-zfs:
	@ln -sf `pwd`/zshrc ${HOME}/.zshrc
	@ln -sf `pwd`/zprofile ${HOME}/.zprofile

install-aliases:
	@ln -sf `pwd`/aliases ${HOME}/.aliases

uninstall:
	echo "nothing yet"
