# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

PROJECT_NAME="xoreos"
DESCRIPTION="A resource explorer for BioWare's Aurora engine games"
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
