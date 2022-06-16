# JS Modules

For js, nodejs,...


## How this project was made

- Setup

	```bash
	# Init git
	git init

	# Create modules folder
	mkdir tool; mkdir tool/compet; cd tool/compet;

	# Add git submodules
	git submodule add https://github.com/darkcompet/js-core.git
	git submodule add https://github.com/darkcompet/nodejs-core.git
	git submodule add https://github.com/darkcompet/nodejs-cardano-node.git
	git submodule add https://github.com/darkcompet/nodejs-cardano-wallet.git
	```


## How to make new module

- Register new module

	```bash
	# Turn off root git
	mv .git .git-tmp

	# Make new folder
	mkdir nodejs-cardano-node
	cd nodejs-cardano-node
	# Add source code files, then push to remote server (lets use vscode for simple)
	git init
	git add --all
	git commit -m "replace_message_here"
	git push
	cd ..

	# Turn on root git
	mv .git-tmp .git

	# Remove repo at local, and add as submodule to git
	rm nodejs-cardano-node
	cd tool/compet
	git submodule add https://github.com/darkcompet/nodejs-cardano-node.git
	```


## Tips

- How to remove a submodule

	```bash
	# Goto directory of added submodules and Delete from git
	cd tool/compet
	git submodule deinit -f csharp-core
	git rm -f csharp-core

	# Delete from disk
	rm -rf .git/modules/tool/compet/csharp-core

	# Delete record from .gitmodules
	Manually delete lines of the submodule from file `.gitmodules`
	```
