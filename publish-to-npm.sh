
target=$1

if [[ $target == "js-core" ]]; then
	cd ~/workspace/darkcompet/libraries/js-modules/tool/compet/js-core;
	npm publish;
elif [[ $target == "nodejs-core" ]]; then
	cd ~/workspace/darkcompet/libraries/js-modules/tool/compet/nodejs-core;
	npm publish;
elif [[ $target == "nodejs-cardano-cli" ]]; then
	cd ~/workspace/darkcompet/libraries/js-modules/tool/compet/nodejs-cardano-cli;
	npm publish;
elif [[ $target == "nodejs-cardano-support" ]]; then
	cd ~/workspace/darkcompet/libraries/js-modules/tool/compet/nodejs-cardano-support;
	npm publish;
elif [[ $target == "nodejs-s3" ]]; then
	cd ~/workspace/darkcompet/libraries/js-modules/tool/compet/nodejs-s3;
	npm publish;
else
	echo "One of: js-core, nodejs-core, nodejs-cardano-cli, nodejs-cardano-support, nodejs-s3"
fi
