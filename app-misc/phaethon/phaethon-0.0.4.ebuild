# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"

inherit autotools wxwidgets

PROJECT_NAME="xoreos"
DESCRIPTION="A resource explorer for BioWare's Aurora engine games"
HOMEPAGE="https://xoreos.org/"
SRC_URI="https://github.com/${PROJECT_NAME}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

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
	>=app-arch/xz-utils-5.0.3
	>=dev-libs/boost-1.53.0[threads]
	x11-libs/wxGTK:${WX_GTK_VER}[opengl,X]
	>=media-libs/openal-1.12
	>=media-libs/libmad-0.15.1b
	>=media-libs/libogg-1.2.0
	>=media-libs/libvorbis-1.3.1
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
		--with-std \
		--with-release=Gentoo
}
