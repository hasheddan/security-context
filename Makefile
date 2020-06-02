# Set the shell to bash always
SHELL := /bin/bash

build:
	docker build . -f images/no-uid-no-gid/Dockerfile -t hasheddan/no-uid-no-gid
	docker build . -f images/uid-no-gid/Dockerfile -t hasheddan/uid-no-gid
	docker build . -f images/uid-gid/Dockerfile -t hasheddan/uid-gid

push:
	docker push hasheddan/no-uid-no-gid
	docker push hasheddan/uid-no-gid
	docker push hasheddan/uid-gid

apply:
	kubectl apply -f pods/ -R

delete:
	kubectl delete -f pods/ -R

.PHONY: build push apply delete