# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2 java-ant-2 eutils

DESCRIPTION="Jeremie provides an RMI-like programming style."
HOMEPAGE="http://jonathan.objectweb.org/"
SRC_URI="http://gentooexperimental.org/distfiles/${P}.tar.bz2"
# cvs -d:pserver:anonymous@cvs.forge.objectweb.org:/cvsroot/jonathan login
# cvs -z3 -d:pserver:anonymous@cvs.forge.objectweb.org:/cvsroot/jonathan export -r JEREMIE_4_2 jeremie
# tar cjvf jeremie-4.2.tar.bz jeremie

LICENSE="LGPL-2.1"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=">=virtual/jdk-1.4
	dev-java/ant-core
	dev-java/ant-owanttask"
RDEPEND=">=virtual/jre-1.4
	=dev-java/jonathan-core-4*
	=dev-java/kilim-2*
	dev-java/monolog
	dev-java/nanoxml"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-classpath.patch"

	cd externals
	rm *.jar
	java-pkg_jar-from jonathan-core-4
	java-pkg_jar-from kilim-1 kilim.jar
	java-pkg_jar-from monolog ow_monolog.jar
	java-pkg_jar-from nanoxml nanoxml-lite.jar nanoxml-lite-2.2.1.jar
	java-pkg_jar-from ant-core ant.jar

	# the jar from my ow-util-ant-tasks seems to slightly not work
	cd ../config
	rm *.jar
	java-pkg_jar-from ant-owanttask
}

src_compile() {
	eant jar $(use_doc jdoc -Doutput.dist.jdoc=output/dist/doc/api)
}

src_install() {
	java-pkg_dojar output/dist/lib/*.jar
	use doc && java-pkg_dojavadoc output/dist/doc/javadoc/user
}
