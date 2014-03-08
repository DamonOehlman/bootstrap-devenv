PACKER_HOME ?= ~/packer
PACKER_CACHE_DIR ?= ${PACKER_HOME}/cache

build: validate
	PACKER_CACHE_DIR=${PACKER_CACHE_DIR} ${PACKER_HOME}/packer build packer.json

validate:
	${PACKER_HOME}/packer validate packer.json