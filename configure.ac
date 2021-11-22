dnl run `autoreconf -i` to generate a configure script.
dnl Then run ./configure to generate a Makefile.
dnl Finally run make to generate the project.

AC_INIT([depgrapher], [0.0.0], [disy])
# Check for programs I need for my build
AC_CANONICAL_TARGET

AC_ARG_VAR([ripgrep], [How to call ripgrep.])
AC_CHECK_TARGET_TOOL([ripgrep], [rg], [no])
AS_IF([test "x$ripgrep" = "xno"],
      [AC_MSG_WARN([cannot find Ripgrep which is required for searching dependencies. Please see the README for required tools.])])

AC_ARG_VAR([graphviz], [How to call graphviz.])
AC_CHECK_TARGET_TOOL([graphviz], [dot], [no])
AS_IF([test "x$graphviz" = "xno"],
      [AC_MSG_WARN([cannot find graphviz dot which is required to create the graph. Please see the README for required tools.])])

AC_ARG_VAR([inkscape], [How to call inkscape.])
AC_CHECK_TARGET_TOOL([inkscape], [inkscape], [no])
AS_IF([test "x$inkscape" = "xno"],
      [AC_MSG_WARN([cannot find inkscape which is required to show the graph. Please see the README for required tools.])])

# Run automake, GNU style, so we need NEWS, ChangeLog and README
AM_INIT_AUTOMAKE()
AM_MAINTAINER_MODE([enable])
AC_CONFIG_FILES([Makefile])
# add all files which must be available in the build folder
# during make distcheck (there the source folder is read only).
AC_CONFIG_LINKS([AUTHORS.in:AUTHORS.in])

# link the file to preprocess with the configured datapaths
AC_CONFIG_LINKS([depgrapher.in:depgrapher.in])AC_OUTPUT
