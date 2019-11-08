# silasb's configs

Read `Makefile` to know the different `make install-*` commands.

## Atom

Backup:
	apm list --installed --bare > atom.packages.list

Install:
	apt install `cat atom.packages.list`
