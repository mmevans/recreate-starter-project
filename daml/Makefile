VERSION := 0.0.1
DIST_DIR := .daml/dist
DAML := "daml"

DAR_INTERFACE := $(DIST_DIR)/models-$(VERSION).dar
SRCS := $(shell find models -name '*.daml' -or -name 'daml.yaml')
DAR := $(DIST_DIR)/models-$(VERSION).dar

SRCS_INIT := $(shell find init -name '*.daml' -or -name 'daml.yaml')
DAR_INIT := $(DIST_DIR)/init-$(VERSION).dar

SRCS_TEST := $(shell find test -name '*.daml' -or -name 'daml.yaml')
DAR_TEST := $(DIST_DIR)/test-$(VERSION).dar

DAML_DIRS := $(shell find . -name '.daml')

.PHONY: all install test clean

all: test install

test: $(DAR_TEST)
	$(DAML) test --project-root test

clean:
	rm -rf $(DAML_DIRS)

install: $(DAR) $(DAR_INIT) $(DAR_TEST)

$(DAR):$(SRCS) $(DAR)
	$(DAML) build --project-root models -o $@

$(DAR_TEST):$(SRCS_TEST) $(DAR_TEST)
	$(DAML) build --project-root test -o $@

$(DAR_INIT):$(SRCS_INIT) $(DAR_INIT)
	$(DAML) build --project-root init -o $@


echo:
	@echo DAML_DIRS: $(DAML_DIRS)
	@echo DAR_INTERFACE: $(DAR_INTERFACE)
	@echo SRCS: $(SRCS)
	@echo DAR: $(DAR)
	@echo SRCS_TEST: $(SRCS_TEST)
	@echo DAR_TEST: $(DAR_TEST)
	@echo INIT_TEST: $(INIT_TEST)