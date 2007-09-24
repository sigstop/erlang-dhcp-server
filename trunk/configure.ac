AC_INIT([erlang-dhcp-server], [1.0.0], [ruslan@babayev.com])

AC_PREREQ([2.59c])
AC_COPYRIGHT([Copyright (C) 2006 Ruslan Babayev])
AM_INIT_AUTOMAKE

AC_ERLANG_SUBST_ROOT_DIR
AC_ERLANG_SUBST_LIB_DIR
AC_ERLANG_SUBST_ERTS_VER
AC_ERLANG_CHECK_LIB([kernel])
AC_ERLANG_CHECK_LIB([stdlib])
AC_ERLANG_SUBST_INSTALL_LIB_SUBDIR([dhcp], [1.0.0])

AC_CONFIG_FILES([Makefile src/Makefile src/dhcp.app src/dhcp.rel])

AC_OUTPUT
