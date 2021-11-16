dnl run `autoreconf -i` to generate a configure script.
dnl Then run ./configure to generate a Makefile.
dnl Finally run make to generate the project.

AC_INIT([depgrapher], [0.0.0], [disy])
# Check for programs I need for my build
AC_CANONICAL_TARGET
# Run automake, GNU style, so we need NEWS, ChangeLog and README
AM_INIT_AUTOMAKE()
AM_MAINTAINER_MODE([enable])
AC_CONFIG_FILES([Makefile])
# add all files which must be available in the build folder
# during make distcheck (there the source folder is read only).
AC_CONFIG_LINKS([AUTHORS.in:AUTHORS.in])

# link the file to preprocess with the configured datapaths
AC_CONFIG_LINKS([depgrapher.in:depgrapher.in])AC_OUTPUT