#!/bin/sh
DEV_PREFIX=/opt
export ANDROID_NDK=${DEV_PREFIX}/ndk
export CROSS_COMPILE=arm-linux-androideabi
export ANDROID_PREFIX=/tmp/chain
export SYSROOT=${ANDROID_NDK}/platforms/android-17/arch-arm
export CROSS_PATH=${ANDROID_PREFIX}/bin/${CROSS_COMPILE}
export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export STRIP=${CROSS_PATH}-strip
export RANLIB=${CROSS_PATH}-ranlib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CFLAGS="-static -I${SYSROOT}/usr/include \
-I${ANDROID_PREFIX}/include \
-I${DEV_PREFIX}/android/bionic \
-I/data/local/tmp/lib/include \
-I/data/local/tmp/lib/luajit-2.0 \
-UHAVE_ICONV_H \
-UHAVE_LANGINFO_H \
-UHAVE_GETPWENT \
-UHAVE_GETPWNAM \
-UHAVE_GETPWUID  \
-UHAVE_ICONV \
-UHAVE_NL_LANGINFO_CODESET \
-UHAVE_LIBINTL_H \
-UHAVE_LOCALE_H \
-UHAVE_GETTEXT \
 "
export CPPFLAGS="${CFLAGS}"
export LDFLAGS="${LDFLAGS} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -L/data/local/tmp/lib -L/data/local/tmp/lib/libncurses.so -L/data/local/tmp/lib/libluajit.so"
TERMINFO=/data/local/tmp/lib/terminfo
export PREFIX=/data/local/tmp
export BINDIR=/xbin
export MANDIR=/data/local/tmp/lib/share/man
export DATADIR=/data/local/tmp/lib/share.vim
export DESTDIR=
cd jni && \
  vim_cv_toupper_broken=true \
  vim_cv_terminfo=/data/local/tmp/lib/terminfo \
  vim_cv_tty_group=world \
  vim_cv_tty_mode=0620 \
  vim_cv_getcwd_broken=true \
  vim_cv_stat_ignores_slash=true \
  vim_cv_memmove_handles_overlap=true \
  vim_cv_bcopy_handles_overlap=true \
  vim_cv_memcpy_handles_overlap=true \
  ./configure \
  "CFLAGS=${CFLAGS}" "LDFLAGS=${LDFLAGS}" \
  --with-modified-by="Aaron D. Pierce" \
  --with-compiledby="Aaron D. Pierce" \
  --with-local-dir=/data/local/tmp/lib/share.vim \
  --datarootdir=/data/local/tmp/lib/share \
  --bindir=/data/local/tmp/xbin \
  --disable-gui \
  --disable-xsmp \
  --disable-nls \
  --disable-acl \
  --with-lua-prefix=/data/local/tmp/lib \
  --enable-luainterp=dynamic \
  --with-luajit \
  --with-tlib=ncurses \
  --host=${CROSS_COMPILE} \
  --with-sysroot=${SYSROOT} \
  --prefix=${PREFIX} "$@" && make 
make installvimbin installrtbase installmacros installspell
#   -h, --help              display this help and exit
#       --help=short        display options specific to this package
#       --help=recursive    display the short help of all the included packages
#   -V, --version           display version information and exit
#   -q, --quiet, --silent   do not print \`checking ...' messages
#       --cache-file=FILE   cache test results in FILE [disabled]
#   -C, --config-cache      alias for \`--cache-file=config.cache'
#   -n, --no-create         do not create output files
#       --srcdir=DIR        find the sources in DIR [configure dir or \`..']
#   --prefix=PREFIX         install architecture-independent files in PREFIX
#   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#   --bindir=DIR            user executables [EPREFIX/bin]
#   --sbindir=DIR           system admin executables [EPREFIX/sbin]
#   --libexecdir=DIR        program executables [EPREFIX/libexec]
#   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#   --libdir=DIR            object code libraries [EPREFIX/lib]
#   --includedir=DIR        C header files [PREFIX/include]
#   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#   --infodir=DIR           info documentation [DATAROOTDIR/info]
#   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#   --mandir=DIR            man documentation [DATAROOTDIR/man]
#   --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]
#   --htmldir=DIR           html documentation [DOCDIR]
#   --dvidir=DIR            dvi documentation [DOCDIR]
#   --pdfdir=DIR            pdf documentation [DOCDIR]
#   --psdir=DIR             ps documentation [DOCDIR]
#   --x-includes=DIR    X include files are in DIR
#   --x-libraries=DIR   X library files are in DIR
#   --disable-option-checking  ignore unrecognized --enable/--with options
#   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#   --enable-fail-if-missing    Fail if dependencies on additional features
#   --disable-darwin        Disable Darwin (Mac OS X) support.
#   --disable-smack	  Do not check for Smack support.
#   --disable-selinux	  Do not check for SELinux support.
#   --disable-xsmp          Disable XSMP session management
#   --disable-xsmp-interact Disable XSMP interaction
#   --enable-luainterp=OPTS     Include Lua interpreter.  default=no OPTS=no/yes/dynamic
#   --enable-mzschemeinterp   Include MzScheme interpreter.
#   --enable-perlinterp=OPTS     Include Perl interpreter.  default=no OPTS=no/yes/dynamic
#   --enable-pythoninterp=OPTS   Include Python interpreter. default=no OPTS=no/yes/dynamic
#   --enable-python3interp=OPTS   Include Python3 interpreter. default=no OPTS=no/yes/dynamic
#   --enable-tclinterp      Include Tcl interpreter.
#   --enable-rubyinterp=OPTS     Include Ruby interpreter.  default=no OPTS=no/yes/dynamic
#   --enable-cscope         Include cscope interface.
#   --enable-workshop       Include Sun Visual Workshop support.
#   --disable-netbeans      Disable NetBeans integration support.
#   --enable-sniff          Include Sniff interface.
#   --enable-multibyte      Include multibyte editing support.
#   --enable-hangulinput    Include Hangul input support.
#   --enable-xim            Include XIM input support.
#   --enable-fontset        Include X fontset output support.
#   --enable-gui=OPTS     X11 GUI default=auto OPTS=auto/no/gtk2/gnome2/motif/athena/neXtaw/photon/carbon
#   --enable-gtk2-check     If auto-select GUI, check for GTK+ 2 default=yes
#   --enable-gnome-check    If GTK GUI, check for GNOME default=no
#   --enable-motif-check    If auto-select GUI, check for Motif default=yes
#   --enable-athena-check   If auto-select GUI, check for Athena default=yes
#   --enable-nextaw-check   If auto-select GUI, check for neXtaw default=yes
#   --enable-carbon-check   If auto-select GUI, check for Carbon default=yes
#   --disable-gtktest       Do not try to compile and run a test GTK program
#   --disable-largefile     omit support for large files
#   --disable-acl           Don't check for ACL support.
#   --disable-gpm           Don't use gpm (Linux mouse daemon).
#   --disable-sysmouse    Don't use sysmouse (mouse in *BSD console).
#   --disable-nls           Don't support NLS (gettext()).
#   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#   --with-mac-arch=ARCH    current, intel, ppc or both
#   --with-developer-dir=PATH    use PATH as location for Xcode developer tools
#   --with-local-dir=PATH   search PATH instead of /usr/local for local libraries.
#   --without-local-dir     do not search /usr/local for local libraries.
#   --with-vim-name=NAME    what to call the Vim executable
#   --with-ex-name=NAME     what to call the Ex executable
#   --with-view-name=NAME   what to call the View executable
#   --with-global-runtime=DIR    global runtime directory in 'runtimepath'
#   --with-modified-by=NAME       name of who modified a release version
#   --with-features=TYPE    tiny, small, normal, big or huge (default: normal)
#   --with-compiledby=NAME  name to show in :version message
#   --with-lua-prefix=PFX   Prefix where Lua is installed.
#   --with-luajit           Link with LuaJIT instead of Lua.
#   --with-plthome=PLTHOME   Use PLTHOME.
#   --with-python-config-dir=PATH  Python's config directory
#   --with-python3-config-dir=PATH  Python's config directory
#   --with-tclsh=PATH       which tclsh to use (default: tclsh8.0)
#   --with-ruby-command=RUBY  name of the Ruby command (default: ruby)
#   --with-x                use the X Window System
#   --with-gnome-includes=DIR Specify location of GNOME headers
#   --with-gnome-libs=DIR   Specify location of GNOME libs
#   --with-gnome            Specify prefix for GNOME files
#   --with-motif-lib=STRING   Library for Motif
#   --with-tlib=library     terminal library to be used
cat<<!EOF>/dev/null
/* auto/config.h.  Generated from config.h.in by configure.  */
/*
 * config.h.in.  Generated automatically from configure.in by autoheader, and
 * manually changed after that.
 */

/* Define if we have EBCDIC code */
/* #undef EBCDIC */

/* Define unless no X support found */
#define HAVE_X11 1

/* Define when terminfo support found */
#define TERMINFO 1

/* Define when termcap.h contains ospeed */
#define HAVE_OSPEED 1

/* Define when ospeed can be extern */
/* #undef OSPEED_EXTERN */

/* Define when termcap.h contains UP, BC and PC */
#define HAVE_UP_BC_PC 1

/* Define when UP, BC and PC can be extern */
/* #undef UP_BC_PC_EXTERN */

/* Define when termcap.h defines outfuntype */
/* #undef HAVE_OUTFUNTYPE */

/* Define when __DATE__ " " __TIME__ can be used */
#define HAVE_DATE_TIME 1

/* Define when __attribute__((unused)) can be used */
#define HAVE_ATTRIBUTE_UNUSED 1

/* defined always when using configure */
#define UNIX 1

/* Defined to the size of an int */
#define VIM_SIZEOF_INT 4

/* Defined to the size of a long */
#define VIM_SIZEOF_LONG 4

/* Defined to the size of off_t */
#define SIZEOF_OFF_T 8

/* Defined to the size of time_t */
#define SIZEOF_TIME_T 4

/* Define when wchar_t is only 2 bytes. */
/* #undef SMALL_WCHAR_T */

/*
 * If we cannot trust one of the following from the libraries, we use our
 * own safe but probably slower vim_memmove().
 */
/* #undef USEBCOPY */
#define USEMEMMOVE 1
/* #undef USEMEMCPY */

/* Define when "man -s 2" is to be used */
#define USEMAN_S 1

/* Define to empty if the keyword does not work.  */
/* #undef const */

/* Define to empty if the keyword does not work.  */
/* #undef volatile */

/* Define to int' if <sys/types.h> doesn't define.  */
/* #undef mode_t */

/* Define to long' if <sys/types.h> doesn't define.  */
/* #undef off_t */

/* Define to long' if <sys/types.h> doesn't define.  */
/* #undef pid_t */

/* Define to unsigned' if <sys/types.h> doesn't define.  */
/* #undef size_t */

/* Define to int' if <sys/types.h> doesn't define.  */
/* #undef uid_t */

/* Define to unsigned int' or other type that is 32 bit.  */
/* #undef uint32_t */

/* Define to int' if <sys/types.h> doesn't define.  */
/* #undef gid_t */

/* Define to long' if <sys/types.h> doesn't define.  */
/* #undef ino_t */

/* Define to unsigned' if <sys/types.h> doesn't define.  */
/* #undef dev_t */

/* Define on big-endian machines */
/* #undef WORDS_BIGENDIAN */

/* Define to unsigned long' if <sys/types.h> doesn't define.  */
/* #undef rlim_t */

/* Define to struct sigaltstack if <signal.h> doesn't define.  */
/* #undef stack_t */

/* Define if stack_t has the ss_base field. */
/* #undef HAVE_SS_BASE */

/* Define if you can safely include both <sys/time.h> and <time.h>.  */
#define TIME_WITH_SYS_TIME 1

/* Define if you can safely include both <sys/time.h> and <sys/select.h>.  */
#define SYS_SELECT_WITH_SYS_TIME 1

/* Define if you have /dev/ptc */
/* #undef HAVE_DEV_PTC */

/* Define if you have Sys4 ptys */
#define HAVE_SVR4_PTYS 1

/* Define to range of pty names to try */
/* #undef PTYRANGE0 */
/* #undef PTYRANGE1 */

/* Define mode for pty */
/* #undef PTYMODE */

/* Define group for pty */
/* #undef PTYGROUP */

/* Define as the return type of signal handlers (int or void).  */
#define RETSIGTYPE void

/* Define as the command at the end of signal handlers ("" or "return 0;").  */
#define SIGRETURN return

/* Define if struct sigcontext is present */
#define HAVE_SIGCONTEXT 1

/* Define if touuper/tolower only work on lower/upercase characters */
/* #undef BROKEN_TOUPPER */

/* Define if stat() ignores a trailing slash */
/* #undef STAT_IGNORES_SLASH */

/* Define if tgetstr() has a second argument that is (char *) */
/* #undef TGETSTR_CHAR_P */

/* Define if tgetent() returns zero for an error */
#define TGETENT_ZERO_ERR 0

/* Define if the getcwd() function should not be used.  */
/* #undef BAD_GETCWD */

/* Define if you the function: */
#define HAVE_BCMP 1
#define HAVE_FCHDIR 1
#define HAVE_FCHOWN 1
#define HAVE_FSEEKO 1
#define HAVE_FSYNC 1
#define HAVE_GETCWD 1
/* #undef HAVE_GETPSEUDOTTY */
#define HAVE_GETPWENT 1
#define HAVE_GETPWNAM 1
#define HAVE_GETPWUID 1
#define HAVE_GETRLIMIT 1
#define HAVE_GETTIMEOFDAY 1
#define HAVE_GETWD 1
#define HAVE_ICONV 1
#define HAVE_NL_LANGINFO_CODESET 1
#define HAVE_LSTAT 1
#define HAVE_MEMCMP 1
#define HAVE_MEMSET 1
#define HAVE_MKDTEMP 1
#define HAVE_NANOSLEEP 1
#define HAVE_OPENDIR 1
#define HAVE_FLOAT_FUNCS 1
#define HAVE_PUTENV 1
#define HAVE_QSORT 1
#define HAVE_READLINK 1
#define HAVE_RENAME 1
#define HAVE_SELECT 1
/* #undef HAVE_SELINUX */
#define HAVE_SETENV 1
#define HAVE_SETPGID 1
#define HAVE_SETSID 1
#define HAVE_SIGACTION 1
#define HAVE_SIGALTSTACK 1
#define HAVE_SIGSET 1
/* #undef HAVE_SIGSETJMP */
#define HAVE_SIGSTACK 1
#define HAVE_SIGVEC 1
/* #undef HAVE_SMACK */
#define HAVE_STRCASECMP 1
#define HAVE_STRERROR 1
#define HAVE_STRFTIME 1
/* #undef HAVE_STRICMP */
#define HAVE_STRNCASECMP 1
/* #undef HAVE_STRNICMP */
#define HAVE_STRPBRK 1
#define HAVE_STRTOL 1
#define HAVE_ST_BLKSIZE 1
#define HAVE_SYSCONF 1
/* #undef HAVE_SYSCTL */
#define HAVE_SYSINFO 1
#define HAVE_SYSINFO_MEM_UNIT 1
#define HAVE_TGETENT 1
#define HAVE_TOWLOWER 1
#define HAVE_TOWUPPER 1
#define HAVE_ISWUPPER 1
#define HAVE_USLEEP 1
#define HAVE_UTIME 1
#define HAVE_BIND_TEXTDOMAIN_CODESET 1

/* Define, if needed, for accessing large files. */
/* #undef _LARGE_FILES */
#define _FILE_OFFSET_BITS 64
/* #undef _LARGEFILE_SOURCE */

/* Define if you do not have utime(), but do have the utimes() function. */
#define HAVE_UTIMES 1

/* Define if you have the header file: */
#define HAVE_DIRENT_H 1
#define HAVE_ERRNO_H 1
#define HAVE_FCNTL_H 1
/* #undef HAVE_FRAME_H */
#define HAVE_ICONV_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_LANGINFO_H 1
/* #undef HAVE_LIBC_H */
#define HAVE_LIBGEN_H 1
#define HAVE_LIBINTL_H 1
#define HAVE_LOCALE_H 1
#define HAVE_MATH_H 1
/* #undef HAVE_NDIR_H */
#define HAVE_POLL_H 1
/* #undef HAVE_PTHREAD_NP_H */
#define HAVE_PWD_H 1
#define HAVE_SETJMP_H 1
#define HAVE_SGTTY_H 1
#define HAVE_STDINT_H 1
#define HAVE_STRINGS_H 1
#define HAVE_STROPTS_H 1
/* #undef HAVE_SYS_ACCESS_H */
/* #undef HAVE_SYS_ACL_H */
/* #undef HAVE_SYS_DIR_H */
#define HAVE_SYS_IOCTL_H 1
/* #undef HAVE_SYS_NDIR_H */
#define HAVE_SYS_PARAM_H 1
#define HAVE_SYS_POLL_H 1
/* #undef HAVE_SYS_PTEM_H */
#define HAVE_SYS_RESOURCE_H 1
#define HAVE_SYS_SELECT_H 1
#define HAVE_SYS_STATFS_H 1
/* #undef HAVE_SYS_STREAM_H */
#define HAVE_SYS_SYSCTL_H 1
#define HAVE_SYS_SYSINFO_H 1
/* #undef HAVE_SYS_SYSTEMINFO_H */
#define HAVE_SYS_TIME_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_UTSNAME_H 1
#define HAVE_TERMCAP_H 1
#define HAVE_TERMIOS_H 1
#define HAVE_TERMIO_H 1
#define HAVE_WCHAR_H 1
#define HAVE_WCTYPE_H 1
#define HAVE_UNISTD_H 1
/* #undef HAVE_UTIL_DEBUG_H */
/* #undef HAVE_UTIL_MSGI18N_H */
#define HAVE_UTIME_H 1
#define HAVE_X11_SUNKEYSYM_H 1
/* #undef HAVE_XM_XM_H */
/* #undef HAVE_XM_XPMP_H */
/* #undef HAVE_XM_TRAITP_H */
/* #undef HAVE_XM_MANAGER_H */
/* #undef HAVE_XM_UNHIGHLIGHTT_H */
/* #undef HAVE_XM_JOINSIDET_H */
/* #undef HAVE_XM_NOTEBOOK_H */
/* #undef HAVE_X11_XPM_H */
/* #undef HAVE_X11_XMU_EDITRES_H */
#define HAVE_X11_SM_SMLIB_H 1

/* Define to the type of the XpmAttributes type. */
/* #undef XPMATTRIBUTES_TYPE */

/* Define if you have <sys/wait.h> that is POSIX.1 compatible.  */
#define HAVE_SYS_WAIT_H 1

/* Define if you have a <sys/wait.h> that is not POSIX.1 compatible. */
/* #undef HAVE_UNION_WAIT */

/* This is currently unused in vim: */
/* Define if you have the ANSI C header files. */
/* #undef STDC_HEADERS */

/* instead, we check a few STDC things ourselves */
#define HAVE_STDARG_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1

/* Define if strings.h cannot be included when strings.h already is */
/* #undef NO_STRINGS_WITH_STRING_H */

/* Define if you want tiny features. */
/* #undef FEAT_TINY */

/* Define if you want small features. */
/* #undef FEAT_SMALL */

/* Define if you want normal features. */
#define FEAT_NORMAL 1

/* Define if you want big features. */
/* #undef FEAT_BIG */

/* Define if you want huge features. */
/* #undef FEAT_HUGE */

/* Define if you want to include the Lua interpreter. */
/* #undef FEAT_LUA */

/* Define for linking via dlopen() or LoadLibrary() */
/* #undef DYNAMIC_LUA */

/* Define if you want to include the MzScheme interpreter. */
/* #undef FEAT_MZSCHEME */

/* Define if you want to include the Perl interpreter. */
/* #undef FEAT_PERL */

/* Define for linking via dlopen() or LoadLibrary() */
/* #undef DYNAMIC_PERL */

/* Define if you want to include the Python interpreter. */
/* #undef FEAT_PYTHON */

/* Define if you want to include the Python3 interpreter. */
/* #undef FEAT_PYTHON3 */

/* Define for linking via dlopen() or LoadLibrary() */
/* #undef DYNAMIC_PYTHON */

/* Define for linking via dlopen() or LoadLibrary() */
/* #undef DYNAMIC_PYTHON3 */

/* Define if dynamic python does not require RTLD_GLOBAL */
/* #undef PY_NO_RTLD_GLOBAL */

/* Define if dynamic python3 does not require RTLD_GLOBAL */
/* #undef PY3_NO_RTLD_GLOBAL */

/* Define if you want to include the Ruby interpreter. */
/* #undef FEAT_RUBY */

/* Define for linking via dlopen() or LoadLibrary() */
/* #undef DYNAMIC_RUBY */

/* Define if you want to include the Tcl interpreter. */
/* #undef FEAT_TCL */

/* Define if you want to include the Sniff interface. */
/* #undef FEAT_SNIFF */

/* Define if you want to add support for ACL */
/* #undef HAVE_POSIX_ACL */
/* #undef HAVE_SOLARIS_ZFS_ACL */
/* #undef HAVE_SOLARIS_ACL */
/* #undef HAVE_AIX_ACL */

/* Define if you want to add support of GPM (Linux console mouse daemon) */
/* #undef HAVE_GPM */

/* Define if you want to add support of sysmouse (*BSD console mouse) */
/* #undef HAVE_SYSMOUSE */

/* Define if you want to include the Cscope interface. */
/* #undef FEAT_CSCOPE */

/* Define if you want to include multibyte support. */
/* #undef FEAT_MBYTE */

/* Define if you want to include fontset support. */
/* #undef FEAT_XFONTSET */

/* Define if you want to include XIM support. */
/* #undef FEAT_XIM */

/* Define if you want to include Hangul input support. */
/* #undef FEAT_HANGULIN */

/* Define if you use GTK and want GNOME support. */
/* #undef FEAT_GUI_GNOME */

/* Define if you use KDE and want KDE Toolbar support. */
/* #undef FEAT_KDETOOLBAR */

/* Define if GTK+ multihead support is available (requires GTK+ >= 2.1.1). */
/* #undef HAVE_GTK_MULTIHEAD */

/* Define if your X has own locale library */
/* #undef X_LOCALE */

/* Define if we have dlfcn.h. */
#define HAVE_DLFCN_H 1

/* Define if there is a working gettext(). */
#define HAVE_GETTEXT 1

/* Define if _nl_msg_cat_cntr is present. */
#define HAVE_NL_MSG_CAT_CNTR 1

/* Define if we have dlopen() */
#define HAVE_DLOPEN 1

/* Define if we have dlsym() */
#define HAVE_DLSYM 1

/* Define if we have dl.h. */
/* #undef HAVE_DL_H */

/* Define if we have shl_load() */
/* #undef HAVE_SHL_LOAD */

/* Define if you want to include Sun Visual Workshop support. */
/* #undef FEAT_SUN_WORKSHOP */

/* Define if you want to include NetBeans integration. */
#define FEAT_NETBEANS_INTG 1

/* Define default global runtime path */
/* #undef RUNTIME_GLOBAL */

/* Define name of who modified a released Vim */
/* #undef MODIFIED_BY */

/* Define if you want XSMP interaction as well as vanilla swapfile safety */
#define USE_XSMP_INTERACT 1

/* Define if fcntl()'s F_SETFD command knows about FD_CLOEXEC */
#define HAVE_FD_CLOEXEC 1

/* Define if you want Cygwin to use the WIN32 clipboard, not compatible with X11*/
/* #undef FEAT_CYGWIN_WIN32_CLIPBOARD */

/* Define if we have AvailabilityMacros.h on Mac OS X */
/* #undef HAVE_AVAILABILITYMACROS_H */

/* Define if Xutf8SetWMProperties() is in an X library. */
#define HAVE_XUTF8SETWMPROPERTIES 1
EOF
