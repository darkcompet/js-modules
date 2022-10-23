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
	git submodule add https://github.com/darkcompet/nodejs-cardano-cli.git
	git submodule add https://github.com/darkcompet/nodejs-cardano-wallet.git
	```


## How to make new module

- Register new module

	```bash
	# Turn off root git
	mv .git .git-tmp

	# Make new module
	mkdir ournewmodule
	cd ournewmodule
	mkdir src

	# Init git (should also copy .gitignore, .editorconfig from another module)
	git init
	cp ../tool/compet/js-core/.gitignore .

	# Init node project
	npm init

	# Install node modules (typescript, ts-node,...)
	# - For js-based module:
	npm install typescript --save-dev
	# - For nodejs-based module:
	npm install typescript ts-node @types/node @types/express --save-dev

	npx tsc --init

	# Create and Modify `package.json` and `tsconfig.json`
	# Should refer/copy from another module for detail.
	nano package.json
	nano ./tsconfig.json

	# Install darkcompet modules, for eg,. js-core, nodejs-core,...
	npm install @darkcompet/js-core @darkcompet/nodejs-core --save

	# Make index.ts file (Should refer from another module)
	touch src/index.ts

	# Done, push to our public repo (Should use vscode for simple process)
	git add --all
	git commit -m "replace_message_here"
	git push

	# Turn on root git
	cd ../
	mv .git-tmp .git

	# Remove repo at local, and add as submodule to git
	rm ournewmodule
	cd tool/compet
	git submodule add https://github.com/darkcompet/ournewmodule.git
	cd ../..

	# Install node modules and Publish to npm site
	cd tool/compet/ournewmodule
	npm install

	# Onetime login pre-publish (ignore if did before)
	npm login

	# Publish
	# If we use @darkcompet before package name, then by default that package will be privated.
	# To publish without payment, just config publishConfig at package.json,
	# or run below command with `--access public`
	npm publish

	# Check result at
	https://www.npmjs.com/package/@darkcompet/ournewmodule
	```


## Tips

- How to remove a submodule

	```bash
	# Goto directory of added submodules and Delete from git
	cd tool/compet
	git submodule deinit -f js-core
	git rm -f js-core

	# Delete from disk
	rm -rf .git/modules/tool/compet/js-core

	# Delete record from .gitmodules
	Manually delete lines of the submodule from file `.gitmodules`
	```
