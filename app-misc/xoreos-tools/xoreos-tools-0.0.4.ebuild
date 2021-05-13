# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

PROJECT_NAME="xoreos"
DESCRIPTION="Tools to help with xoreos development"
HOMEPAGE="https://xoreos.org/"
SRC_URI="https://github.com/${PROJECT_NAME}/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
	>=dev-libs/libxml2-2.8.0
"
DEPEND="
	${RDEPEND}
"

PATCHES=(
	"${FILESDIR}/${P}-fix-compile.patch"
)

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	econf \
		$(use_with lto) \
		--with-release=Gentoo
}
