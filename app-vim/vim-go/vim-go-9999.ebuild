# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vim-plugin

DESCRIPTION="vim plugin: Go development plugin for Vim"
HOMEPAGE="https://github.com/fatih/vim-go"
LICENSE="BSD"

if [[ "$PV" == 9999 ]]; then
	SRC_URI="https://github.com/fatih/${PN}/archive/master.zip -> ${P}.zip"
	KEYWORDS=""
else
	SRC_URI="https://github.com/fatih/${PN}/archive/v${PV}.zip -> ${P}.zip"
	KEYWORDS="~amd64 ~x86"
fi

VIM_PLUGIN_HELPFILES="$PN"

src_compile() {
	# safely skip `make test` triggered by `make` as it runs `go get` commands
	# TODO: see :GoInstallBinaries (https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt)
	:
}
