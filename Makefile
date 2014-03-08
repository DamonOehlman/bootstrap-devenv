build: validate
	PACKER_CACHE_DIR=~/packer_cache ~/packer/packer build packer.json

validate:
	~/packer/packer validate packer.json