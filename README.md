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
	# [Turn off root git]
	mv .git .git-tmp

	# [Make new module]
	mkdir js-core
	cd js-core
	mkdir src
	# - Init git (should copy .gitignore, .editorconfig from another module)
	git init
	# - Init node project (Refer package.json from another module)
	npm init
	# - Install node modules (typescript, ts-node,...)
	npm install typescript ts-node @types/node @types/express --save-dev
	npx tsc --init
	# - Install darkcompet modules, for eg,. js-core, nodejs-core,...
	npm install @darkcompet/js-core @darkcompet/nodejs-core --save
	# - Make index.ts file (Refer from another module)
	touch index.ts
	# - After everything done, perform Git push
	git add --all
	git commit -m "replace_message_here"
	git push
	# - Back to previous folder
	cd ../

	# Turn on root git
	mv .git-tmp .git

	# Remove repo at local, and add as submodule to git
	rm js-core
	cd tool/compet
	git submodule add https://github.com/darkcompet/js-core.git
	cd ../..
	```


## How to make/build/publish npm module

- Make module

	```bash
	# Support we have js-core module, now we will build and publish this to npm.
	# Ref: https://viblo.asia/p/build-va-publish-mot-npm-typescript-package-gDVK2nGnKLj
	cd js-core
	npm init

	# For js-based module
	npm install typescript --save-dev
	# For nodejs-based module
	npm install typescript ts-node @types/node --save-dev

	npx tsc --init

	# Config package (see result for more detail)
	# "main": "dist/index.js",
	# "types": "dist/index.d.ts",
	# "files": [
	# 	"dist"
	# ],
	# "scripts": {
	# 	"build": "rm -rf dist/ && tsc",
	# 	"prepare": "npm run build"
	# },
	# "keywords": [
	# 	"cardano",
	# 	"wallet",
	# 	"api",
	# 	"nodejs",
	# ],
	nano package.json

	# Config typescript (see result for more detail)
	# "outDir": "./dist",
	# "declaration": true,
	# "include": [
	# 	"src"
	# ],
	# "exclude": [
	# 	"node_modules",
	# 	"test"
	# ]
	nano tsconfig.json

	# Build
	npm run build
	```

- Publish module to npm site

	```bash
	# Goto module folder
	cd js-core

	# Ontime login
	npm login

	# Publish
	# If we use @darkcompet before package, then by default that package will be privated.
	# To publish without payment, just config publishConfig at package.json,
	# or run below command with `--access public`
	npm publish

	# Check result at
	https://www.npmjs.com/package/@darkcompet/js-core
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
