# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Python Cross Package Manager"
HOMEPAGE="https://pypi.python.org/pypi/crosspm https://github.com/devopshq/crosspm"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://pypi.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

RDEPEND="
	dev-python/wheel[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/dohq-art[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]

	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

#S="${WORKDIR}/${P}-${EPYTHON}"

python_compile_all() {
	use doc && emake -C docs html
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
