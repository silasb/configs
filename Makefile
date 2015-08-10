all: install

install:
	echo "No default"

install-vim:
	rm -rfi ${HOME}/.vim
	@ln -sf `pwd`/vimrc ${HOME}/.vimrc
	@ln -sf `pwd`/vim/ ${HOME}/.vim
	@mkdir -p ${HOME}/.vim/bundle
	@git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	@mkdir -p ${HOME}/bin
	@ln -sf `pwd`/bin/ack ${HOME}/bin
	@mkdir -p ${HOME}/.vim/backup
	@echo 'Put export PATH=$$HOME/bin:$$PATH in your *rc file'
	@echo "Run vim +BundleInstall +qall"

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

install-tmux:
	@ln -sf `pwd`/tmux.conf ${HOME}/.tmux.conf

install-hydra:
	@ln -sf `pwd`/hyrda ${HOME}/.hydra

install-bin:
	@ln -sf `pwd`/bin ${HOME}/bin

install-inputrc:
	@ln -sf `pwd`/inputrc ${HOME}/.inputrc

uninstall:
	echo "nothing yet"
