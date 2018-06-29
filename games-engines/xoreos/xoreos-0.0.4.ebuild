# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A reimplementation of BioWare's Aurora engine"
HOMEPAGE="https://xoreos.org/"
SRC_URI="https://github.com/${PN}/${PN}/releases/download/v${PV}/${P}.tar.gz"

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
	virtual/opengl
	>=media-libs/glew-1.13.0:0
	>=media-libs/libsdl2-2.0.0
	>=media-libs/freetype-2.4.0
	>=media-libs/openal-1.12
	>=media-libs/libmad-0.15.1b
	>=media-libs/libogg-1.2.0
	>=media-libs/libvorbis-1.3.1
	>=media-libs/faad2-2.7
	>=media-libs/xvid-1.2.2
"
DEPEND="
	${RDEPEND}
	sys-devel/libtool
	sys-devel/autoconf
	sys-devel/automake
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/${P}-fix-freetype.patch"
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
