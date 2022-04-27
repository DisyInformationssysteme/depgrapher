bin_SCRIPTS = depgrapher

CLEANFILES = $(bin_SCRIPTS)
# the name and executables of the project
depgrapher =
# the data directory. Users can set this via --prefix: @datarootdir@ = PREFIX/share. See ./configure --help
depgrapherdir = @datarootdir@/depgrapher
# the data files
nobase_depgrapher_DATA =
# include the data in the distribution tarball
EXTRA_DIST = $(nobase_depgrapher_DATA)

# additional files to clean which are left over on make distcheck TODO: find out why
DISTCLEANFILES = ./missing ./config.sub ./config.guess ./install-sh

all: $(depgrapher) ChangeLog AUTHORS

install: install-am ## install to locations defined by ./configure
uninstall: uninstall-am ## remove the installed files

depgrapher: depgrapher.in ## build the main program
	cat "$<" | sed "s,"'$${DATADIR}'",$(depgrapherdir),g" | sed "s,"'$${TEMPLATE_FILES}'",$(notdir $(depgrapher_DATA)),g" | sed "s/inkscape/@inkscape@/g" > "$@"
	chmod +x "$@"
.PHONY: help
help: ## Show this help message.
	@echo 'Usage:'
	@echo ':make [target] ...' | sed "s/\(target\)/\\x1b[36m\1\\x1b[m/" | column -c2 -t -s :
	@echo
	@echo 'Targets:'
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed 's/^#//' | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/:\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"
	@echo
	@echo '(see ./configure --help for setup options)'

# create basic files for the tarball
.SECONDARY: ChangeLog AUTHORS
ChangeLog: ## create the ChangeLog from the history
	@echo Generating $@
	@echo "For user-visible changes, see the NEWS file" > @abs_top_builddir@/$@
	@echo >> @abs_top_builddir@/$@
	@if test -d @abs_top_srcdir@/.git; then cd @abs_top_srcdir@; git log --date-order --date=short | sed -e '/^commit.*$$/d' | awk '/^Author/ {sub(/\\$$/,""); getline t; print $0 t; next}; 1' | sed -e 's/^Author: //g' | sed -e 's/\(.*\)>Date:   \([0-9]*-[0-9]*-[0-9]*\)/\2  \1>/g' | sed -e 's/^\(.*\) \(\)\t\(.*\)/\3    \1    \2/g' >> @abs_top_builddir@/$@; cd -; fi
	@if test -d @abs_top_srcdir@/.hg; then hg -R @abs_top_srcdir@ log --style changelog >> $@; fi
AUTHORS: AUTHORS.in ## create the AUTHORS file from the history and AUTHORS.in
	@echo Generating $@
	@cp "$<" "$@"
	@if test -d @abs_top_srcdir@/.git; then cd @abs_top_srcdir@; git log --format='%aN' | sort -u > @abs_top_builddir@/$@; cd -; fi
	@if test -d @abs_top_srcdir@/.hg; then hg -R @abs_top_srcdir@ --config extensions.churn= churn -t "{author}" > $@; fi

