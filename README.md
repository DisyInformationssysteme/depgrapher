depgrapher - Create partial dependency graphs
======================================

Description of depgrapher.

See NEWS for user-visible changes.
See ChangeLog or the history for detailed changes.

## Usage

$ depgrapher [-h | --help] [-s | --sed <SED_EXPRESSION>] [-g | --grep <GREP>] [-p | --plot dot|sfdp] WORKDIR

Examples (run in `path/to/src`):

search for all files connected to paths that contain 'date-time-condition'

    depgrapher --grep 'date-time-condition'
search for all files connected to paths that contain 'import'

    depgrapher --grep 'import'
same, but strip some path components components:

    depgrapher --grep 'import' --sed 's,workbook/,,g;s,workbook-panel/,,g;s,import/,,g'
search for workbook AND conditions, stripping workbook-conditions/, conditions/, and api-client/

    depgrapher --grep 'workbook.*conditions|conditions.*workbook' --sed 's,workbook-conditions/,,g;s,workbook/,,g;s,conditions/,,g;s,api-client/,,g'


## Requirements

- ripgrep
- graphviz
- inkscape
- sed, grep
- bash
- autoconf
- automake

Install requirements on Debian/Ubuntu:

    sudo apt install autoconf automake ripgrep graphviz inkscape

## Install

Clone:

    git clone git@github.com:DisyInformationssysteme/depgrapher.git

Install systemwide:

    cd depgrapher; ./bootstrap.sh && make install

Install only for the current user:

    cd depgrapher; ./bootstrap.sh --prefix=$HOME/.local && make install

To replace inkscape as the viewer, use them as arguments. For example:

    ./bootstrap.sh inkscape=gimp --prefix=$HOME/.local && make install

Also see

    make help

For details on installing a release, see INSTALL

## Contributors

See AUTHORS

Licensed under APL2, see COPYING

## Release Process

* Check/Update NEWS
* Increase version in configure.ac (see semver.org)
* Commit  
  `./bootstrap.sh && make distcheck`


