# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

EGIT_REPO_URI="https://anongit.gentoo.org/git/proj/eselect-java.git"

DESCRIPTION="A set of eselect modules for Java"
HOMEPAGE="http://www.gentoo.org/proj/en/java/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	!!app-eselect/eselect-ecj
	!!app-eselect/eselect-maven
	!!<dev-java/java-config-2.2
	app-admin/eselect"

src_prepare() {
	eautoreconf
}
