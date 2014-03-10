PACKER_HOME ?= ~/packer
PACKER_CACHE_DIR ?= ${PACKER_HOME}/cache
VARS_CONFIG ?= au
TIMEZONE ?= $(shell cat /etc/timezone)
USER_FULLNAME ?= $(shell getent passwd ${USER} | cut -d ':' -f 5 | cut -d ',' -f 1)

build: validate
	PACKER_LOG_PATH=packer.log \
	PACKER_LOG=* \
	PACKER_CACHE_DIR=${PACKER_CACHE_DIR} \
	${PACKER_HOME}/packer build \
	-var-file=${VARS_CONFIG}-vars.json \
	-var 'timezone=${TIMEZONE}' \
	-var 'user=${USER}' \
	-var 'user_fullname=${USER_FULLNAME}' \
	packer.json

validate:
	${PACKER_HOME}/packer validate -var-file=${VARS_CONFIG}-vars.json packer.json