#!/bin/sh

_build_musl_ncurses() {  # 1 - output
	_out="out"; [ -n "$1" ] && _out="$1"; _out="${BUILD_DIR}/${_out}"
	_name="ncurses-${NCURSES_VERSION}"
	_msg "downloading ${_name}"
	_fetch_and_extract "ncurses" "${NCURSES_VERSION}" "https://ftp.gnu.org/pub/gnu/ncurses/"
	_msg "configuring ${_name}"
	CC='gcc -static' CFLAGS='-fPIC' \
	CXX='g++ -static' CXXFLAGS='-fPIC' \
	./configure --prefix="${_out}" --disable-shared --enable-static || _err "configure"
	_msg "building ${_name}"
	make || _err "make"
	_msg "installing ${_name}"
	make install || _err "make install"
}
