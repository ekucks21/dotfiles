.PHONY: test

EMACS ?= emacs
CASK ?= cask

LOAD_PATH = -L .
LOAD_HELPER = -l test/test-helper.el

ELPA_DIR = $(shell EMACS=$(EMACS) $(CASK) package-directory)

test: elpa
	$(CASK) exec $(EMACS) -Q -batch $(LOADPATH) $(LOAD_HELPER) \
		-l test/test-indentation.el \
		-l test/test-highlight.el \
		-f ert-run-tests-batch-and-exit

elpa: $(ELPA_DIR)
$(ELPA_DIR): Cask
	$(CASK) install
	touch $@
