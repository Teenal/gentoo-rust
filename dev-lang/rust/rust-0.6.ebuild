# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Opensource programming language from mozilla"
HOMEPAGE="http://www.rust-lang.org"
SRC_URI="http://static.rust-lang.org/dist/${P}.tar.gz"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
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
	rm -f "/usr/lib/librusti.so"
	rm -f "/usr/lib/librustc.so"
	rm -f "/usr/lib/librust.so"
	rm -f "/usr/lib/librustpkg.so"
	rm -f "/usr/lib/librustdoc.so"
}
