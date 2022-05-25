CURRENT_DISTRIBUTION_CLONE_URL ?= https://github.com/distribution/distribution.git
COMPLETE_DISTRIBUTION_CLONE_URL ?= https://github.com/oci-playground/distribution.git

COMPLETE_REGCLIENT_CLONE_URL ?= https://github.com/oci-playground/regclient.git

CURRENT_GGCR_CLONE_URL ?= https://github.com/google/go-containerregistry.git
INTERMEDIATE_GGCR_CLONE_URL ?= https://github.com/oci-playground/go-containerregistry.git

.PHONY: build-all
build-all: current-registry \
		complete-registry \
		current-consumer \
		intermediate-consumer \
		complete-consumer \
		current-producer \
		intermediate-producer \
		complete-producer

.PHONY: current-registry
current-registry:
	mkdir -p clones
	[ -d clones/distribution-1 ] || git clone $(CURRENT_DISTRIBUTION_CLONE_URL) clones/distribution-1
	cd clones/distribution-1/ && make
	mkdir -p bin/
	mv clones/distribution-1/bin/registry bin/current-registry

.PHONY: complete-registry
complete-registry:
	mkdir -p clones
	[ -d clones/distribution-2 ] || git clone $(COMPLETE_DISTRIBUTION_CLONE_URL) clones/distribution-2
	cd clones/distribution-2/ && make
	mkdir -p bin/
	mv clones/distribution-2/bin/registry bin/complete-registry

.PHONY: current-consumer
current-consumer:
	mkdir -p clones
	[ -d clones/ggcr-1 ] || git clone $(CURRENT_GGCR_CLONE_URL) clones/ggcr-1
	cd clones/ggcr-1/ && go build -o cmd/crane/crane ./cmd/crane/
	mkdir -p bin/
	mv clones/ggcr-1/cmd/crane/crane bin/current-consumer

.PHONY: intermediate-consumer
intermediate-consumer:
	mkdir -p clones
	[ -d clones/ggcr-2 ] || git clone $(INTERMEDIATE_GGCR_CLONE_URL) clones/ggcr-2
	cd clones/ggcr-2/ && go build -o cmd/crane/crane ./cmd/crane/
	mkdir -p bin/
	mv clones/ggcr-2/cmd/crane/crane bin/intermediate-consumer

.PHONY: complete-consumer
complete-consumer:
	mkdir -p clones
	[ -d clones/regclient ] || git clone $(COMPLETE_REGCLIENT_CLONE_URL) clones/regclient
	cd clones/regclient/ && make binaries
	mkdir -p bin/
	mv clones/regclient/bin/regctl bin/complete-consumer

.PHONY: current-producer
current-producer:
	cp bin/current-consumer bin/current-producer

.PHONY: intermediate-producer
intermediate-producer:
	cp bin/intermediate-consumer bin/intermediate-producer

.PHONY: complete-producer
complete-producer:
	cp bin/complete-consumer bin/complete-producer

.PHONY: clean
clean:
	rm -rf clones/ bin/
