dnl Macro for checking if an Erlang library is installed, and to
dnl determine its version

# AC_ERLANG_CHECK_LIB(LIBRARY, [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND])
# -------------------------------------------------------------------
AC_DEFUN([AC_ERLANG_CHECK_LIB],
[AC_REQUIRE([AC_ERLANG_PATH_ERLC])[]dnl
AC_REQUIRE([AC_ERLANG_PATH_ERL])[]dnl
AC_CACHE_CHECK([for Erlang/OTP '$1' library subdirectory],
    [erlang_cv_lib_dir_$1],
    [AC_LANG_PUSH(Erlang)[]dnl
     AC_RUN_IFELSE(
        [AC_LANG_PROGRAM([], [dnl
            ReturnValue = case code:lib_dir("[$1]") of
            {error, bad_name} ->
                file:write_file("conftest.out", "not found\n"),
                1;
            LibDir ->
                file:write_file("conftest.out", LibDir),
                0
            end,
            halt(ReturnValue)])],
        [erlang_cv_lib_dir_$1=`cat conftest.out`],
        [if test ! -f conftest.out; then
             AC_MSG_FAILURE([test Erlang program execution failed])
         else
             erlang_cv_lib_dir_$1="not found"
         fi])
     AC_LANG_POP(Erlang)[]dnl
    ])
AC_CACHE_CHECK([for Erlang/OTP '$1' library version],
    [erlang_cv_lib_ver_$1],
    [AS_IF([test "$erlang_cv_lib_dir_$1" = "not found"],
        [erlang_cv_lib_ver_$1="not found"],
        [erlang_cv_lib_ver_$1=`echo "$erlang_cv_lib_dir_$1" | sed -n -e 's,^.*-\([[^/-]]*\)$,\1,p'`])[]dnl
    ])
AC_SUBST([ERLANG_LIB_DIR_$1], [$erlang_cv_lib_dir_$1])
AC_SUBST([ERLANG_LIB_VER_$1], [$erlang_cv_lib_ver_$1])
AS_IF([test "$erlang_cv_lib_dir_$1" = "not found"], [$3], [$2])
])# AC_ERLANG_CHECK_LIB

dnl Macro for checking the ERTS version

# AC_ERLANG_SUBST_ERTS_VER
# -------------------------------------------------------------------
AC_DEFUN([AC_ERLANG_SUBST_ERTS_VER],
[AC_REQUIRE([AC_ERLANG_NEED_ERLC])[]dnl
AC_REQUIRE([AC_ERLANG_NEED_ERL])[]dnl
AC_CACHE_CHECK([for Erlang/OTP ERTS version],
    [erlang_cv_erts_ver],
    [AC_LANG_PUSH(Erlang)[]dnl
     AC_RUN_IFELSE(
        [AC_LANG_PROGRAM([], [dnl
	    Version = erlang:system_info(version),
            file:write_file("conftest.out", Version),
            halt(0)])],
        [erlang_cv_erts_ver=`cat conftest.out`],
        [AC_MSG_FAILURE([test Erlang program execution failed])])
     AC_LANG_POP(Erlang)[]dnl
    ])
AC_SUBST([ERLANG_ERTS_VER], [$erlang_cv_erts_ver])
])# AC_ERLANG_SUBST_ERTS_VER
