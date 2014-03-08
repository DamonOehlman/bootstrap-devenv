PACKER_HOME ?= ~/packer
PACKER_CACHE_DIR ?= ${PACKER_HOME}/cache
VARS_CONFIG ?= au

build: validate
	PACKER_LOG_PATH=packer.log PACKER_LOG=* PACKER_CACHE_DIR=${PACKER_CACHE_DIR} ${PACKER_HOME}/packer build -var-file=${VARS_CONFIG}-vars.json packer.json

validate:
	${PACKER_HOME}/packer validate -var-file=${VARS_CONFIG}-vars.json packer.json