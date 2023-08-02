VERSION := 0.0.1
DIST_DIR := .daml/dist
DAML := "daml"

DAR_INTERFACE := $(DIST_DIR)/starter-project-$(VERSION).dar
SRCS := $(shell find starter -name '*.daml' -or -name 'daml.yaml')
DAR := $(DIST_DIR)/starter-project-$(VERSION).dar

SRCS_TEST := $(shell find test -name '*.daml' -or -name 'daml.yaml')
DAR_TEST := $(DIST_DIR)/tests-$(VERSION).dar

DAML_DIRS := $(shell find . -name '.daml')

.PHONY: all install test clean

all: test install

test: $(DAR_TEST)
	$(DAML) test --project-root test

clean:
	rm -rf $(DAML_DIRS)

install: $(DAR) $(DAR_TEST)

$(DAR):$(SRCS) $(DAR)
	$(DAML) build --project-root starter -o $@

$(DAR_TEST):$(SRCS_TEST) $(DAR_TEST)
	$(DAML) build --project-root test -o $@

echo:
	@echo DAML_DIRS: $(DAML_DIRS)
	@echo DAR_INTERFACE: $(DAR_INTERFACE)
	@echo SRCS: $(SRCS)
	@echo DAR: $(DAR)
	@echo SRCS_TEST: $(SRCS_TEST)
	@echo DAR_TEST: $(DAR_TEST)