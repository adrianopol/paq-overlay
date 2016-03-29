# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Libpurple (Pidgin) plugin for using a Telegram account"
HOMEPAGE="https://github.com/majn/${PN}"
SRC_URI="https://github.com/majn/telegram-purple/releases/download/v${PV}/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+libwebp"

DEPEND="net-im/pidgin
        dev-libs/openssl
        sys-libs/glibc
        libwebp? ( media-libs/libwebp )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_compile() {
	econf $(use_enable libwebp) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
}
