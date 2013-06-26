# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2 multilib

DESCRIPTION="Open source programming language from Mozilla"
HOMEPAGE="http://www.rust-lang.org/"
EGIT_REPO_URI="git://github.com/mozilla/rust.git"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="clang"

RDEPEND="sys-devel/llvm"
DEPEND="${RDEPEND}
	clang? ( sys-devel/clang )
	>=dev-lang/perl-5.0
	>=dev-lang/python-2.6
"

src_configure() {
	"${ECONF_SOURCE:-.}"/configure \
		--prefix="${EPREFIX}"/usr \
		$(use_enable clang) \
		--local-rust-root="${EPREFIX}"/usr \
	|| die
}

pkg_postinst() {
	rm -f "/usr/$(get_libdir)/librusti.so"
	rm -f "/usr/$(get_libdir)/librustc.so"
	rm -f "/usr/$(get_libdir)/librust.so"
	rm -f "/usr/$(get_libdir)/librustpkg.so"
	rm -f "/usr/$(get_libdir)/librustdoc.so"
}
