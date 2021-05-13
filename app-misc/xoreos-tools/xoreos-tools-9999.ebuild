# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

PROJECT_NAME="xoreos"
DESCRIPTION="Tools to help with xoreos development"
HOMEPAGE="https://xoreos.org/"
EGIT_REPO_URI="https://github.com/${PROJECT_NAME}/${PN}.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="lto"

BDEPEND="
	sys-devel/libtool
	sys-devel/autoconf
	sys-devel/automake
	virtual/pkgconfig
"
RDEPEND="
	virtual/libiconv
	>=sys-libs/zlib-1.2.3
	>=app-arch/xz-utils-5.0.3
	>=dev-libs/libxml2-2.8.0
	>=dev-libs/boost-1.53.0
"
DEPEND="
	${RDEPEND}
"

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	econf \
		$(use_with lto) \
		--with-release=xGentoo
}
