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

uninstall-vim:
	@rm -rfi ${HOME}/.vim
	@rm -i ${HOME}/.vimrc
	@rm -i ${HOME}/bin/ack

install-git:
	@ln -sf `pwd`/gitconfig ${HOME}/.gitconfig

install-zfs:
	@ln -sf `pwd`/zshrc ${HOME}/.zshrc
	@ln -sf `pwd`/zprofile ${HOME}/.zprofile

install-bash:
	@ln -sf `pwd`/bash_profile ${HOME}/.bash_profile
	@ln -sf `pwd`/bashrc ${HOME}/.bashrc

install-aliases:
	@ln -sf `pwd`/aliases ${HOME}/.aliases
	@. ${HOME}/.aliases

uninstall:
	echo "nothing yet"
