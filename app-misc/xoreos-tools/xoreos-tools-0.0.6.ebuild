# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PROJECT_NAME="xoreos"
DESCRIPTION="Tools to help with xoreos development"
HOMEPAGE="https://xoreos.org/"
SRC_URI="https://github.com/${PROJECT_NAME}/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lto"

RDEPEND="
	virtual/libiconv
	>=sys-libs/zlib-1.2.3
	>=app-arch/xz-utils-5.0.3
	>=dev-libs/libxml2-2.8.0
	>=dev-libs/boost-1.53.0
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

src_configure() {
	econf \
		$(use_with lto) \
		--with-release=Gentoo
}
