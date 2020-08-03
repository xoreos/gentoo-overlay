# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PROJECT_NAME="xoreos"
DESCRIPTION="A resource explorer for BioWare's Aurora engine games"
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
	>=dev-libs/boost-1.53.0
	>=dev-qt/qtcore-5.7.1
	>=dev-qt/qtgui-5.7.1
	>=dev-qt/qtwidgets-5.7.1
	>=dev-qt/qtconcurrent-5.7.1
	>=media-libs/openal-1.12
	>=media-libs/libmad-0.15.1b
	>=media-libs/libogg-1.2.0
	>=media-libs/libvorbis-1.3.1
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
