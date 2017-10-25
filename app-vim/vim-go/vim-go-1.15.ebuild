# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vim-plugin

DESCRIPTION="vim plugin: Go development plugin for Vim"
HOMEPAGE="https://github.com/fatih/vim-go"
SRC_URI="https://github.com/fatih/${PN}/archive/v${PV}.zip -> ${P}.zip"
LICENSE="BSD"
KEYWORDS="amd64 ~x86"

VIM_PLUGIN_HELPFILES="$PN"

src_prepare() {
	# TODO: https://bugs.gentoo.org/635420
	rm -rf .github/
}

src_compile() {
	# safely skip `make test` triggered by `make` as it runs `go get` commands
	# TODO: see :GoInstallBinaries (https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt)
	:
}
