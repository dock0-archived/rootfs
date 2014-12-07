DIR=$(shell pwd)

.PHONY : default build_container manual container build push local

default: container

build_container:
	docker build -t vm_root meta

manual: build_container
	./meta/launch /bin/bash || true

container: build_container
	./meta/launch

build:
	dock0 image config.yaml

push:
	@echo $$(sed -r 's/[0-9]+$$//' version)$$(($$(sed -r 's/.*\.//' version) + 1)) > version
	git commit -am "$$(cat version)"
	ssh -oStrictHostKeyChecking=no git@github.com &>/dev/null || true
	git tag -f "$$(cat version)"
	git push --tags origin master
	targit -a .github -c -f dock0/vm_root $$(cat version) /tmp/root.fs.sfs

local: build push
