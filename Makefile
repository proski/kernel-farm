INSTALL_PATH = $(HOME)/bin
RCFILE = $(HOME)/.farmrc

SCRIPTS = farm-checkout farm-clean farm-compile farm-config32 farm-config64 \
	farm-hardlink farm-warnings

INSTALL = install

all:

install:
	$(INSTALL) -m 755 -d $(INSTALL_PATH)
	for scr in $(SCRIPTS); do \
		$(INSTALL) -m 755 $$scr $(INSTALL_PATH); \
	done
	if ! test -e $(RCFILE); then \
		$(INSTALL) -m 644 .farmrc $(RCFILE); \
	fi

clean:

.PHONY: all install clean
