# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A reimplementation of BioWare's Aurora engine"
HOMEPAGE="https://xoreos.org/"
SRC_URI="https://github.com/${PN}/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lto vorbis mad faad xvid vpx"

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
	mad? ( >=media-libs/libmad-0.15.1b )
	vorbis? ( >=media-libs/libogg-1.2.0 )
	vorbis? ( >=media-libs/libvorbis-1.3.1 )
	faad? ( >=media-libs/faad2-2.7 )
	xvid? ( >=media-libs/xvid-1.2.2 )
	vpx? ( >=media-libs/libvpx-1.6.0 )
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

src_configure() {
	econf \
		$(use_with lto) \
		$(use_enable vorbis) \
		$(use_enable mad) \
		$(use_enable faad) \
		$(use_enable xvid xvidcore) \
		$(use_enable vpx) \
		--with-release=Gentoo
}
