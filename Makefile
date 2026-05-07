
DYLAN	?= $${HOME}/dylan

.PHONY: build install test dist clean distclean

build:
	deft update
	deft build dylan-gsl

install: build
	mkdir -p $(DYLAN)/install/dylan-gsl/lib
	cp -r _build/lib/lib* $(DYLAN)/install/dylan-gsl/lib/

test:
	deft update
	deft test -- --progress none --report surefire --report-file=_build/TEST-dylan-gsl.xml

dist: distclean install

clean:
	rm -rf _packages
	rm -rf registry
	rm -rf _build
	rm -rf _test
	rm -rf doc/_build
	rm -rf *~

distclean: clean
	rm -rf $(DYLAN)/install/dylan-gsl
	rm -f $(DYLAN)/bin/dylan-gsl

