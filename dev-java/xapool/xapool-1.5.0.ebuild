# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2 java-ant-2 eutils

MY_P="${P}-src"
DESCRIPTION="XAPool is an open source XA Pool !"
HOMEPAGE="http://xapool.experlog.com/"
SRC_URI="http://download.fr2.forge.objectweb.org/${PN}/${MY_P}.tgz"

LICENSE="LGPL-2.1"
SLOT="1.5"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

# TODO notify upstream about JDBC api change, which changed with 1.6
# TODO use || ( =virtual/jdk-1.4* =virtual/jdk-1.5* )
DEPEND="
	=virtual/jdk-1.4*
	dev-java/ant-core
	jikes? ( dev-java/jikes )"
RDEPEND=">=virtual/jre-1.4
	=dev-java/carol-2.0*
	dev-java/commons-logging
	=dev-java/howl-logger-0.1*
	dev-java/log4j
	dev-java/p6spy"
#	dev-java/sun-j2ee-connector-bin
#	dev-java/jta
S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd ${S}

	epatch ${FILESDIR}/${P}-gentoo.patch
	# don't build oracle or instantdb support
	epatch ${FILESDIR}/${P}-no-instandb-no-oracle.patch

	cd externals
	rm *.jar
	java-pkg_jar-from carol-2.0 ow_carol.jar
	java-pkg_jar-from commons-logging commons-logging.jar
	java-pkg_jar-from howl-logger-0.1 howl.jar
	java-pkg_jar-from log4j
	java-pkg_jar-from p6spy
	# don't seem to need these
#	java-pkg_jar-from jta
#	java-pkg_jar-from sun-j2ee-connector-bin
}

src_compile() {
	# TODO patch build.xml to make jar depend on compile
	local antflags="clean compile jar"
	antflags="${antflags} $(use_doc jdoc -Ddist.jdoc=output/dist/api)"

	eant ${antflags} || die "Compilation failed"
}

src_install() {
	java-pkg_dojar output/dist/lib/*.jar
	dodoc README.txt
	use doc && java-pkg_dojavadoc output/dist/api
}
