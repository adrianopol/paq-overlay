# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="A Python to Artifactory interface"
HOMEPAGE="https://pypi.org/project/dohq-art/ https://github.com/devopshq/artifactory"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
#SRC_URI="https://pypi.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/devopshq/artifactory/archive/${PV}.zip -> ${P}.zip" # FIXME

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	virtual/python-pathlib[${PYTHON_USEDEP}]"

S="${WORKDIR}/artifactory-${PV}"

python_install_all() {
	distutils-r1_python_install_all
}
