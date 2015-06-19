# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EXCALIBUR_MODULES="
	${PN}-api
	${PN}-impl"

EXCALIBUR_MODULE_USES_PV="false"

EXCALIBUR_TESTS="true"

inherit excalibur-multi

SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="=www-servers/jetty-5*
	dev-java/tomcat-jasper
	dev-java/plexus-component-api
	dev-java/plexus-utils
	dev-java/cornerstone-threads
	dev-java/cornerstone-sockets
	=dev-java/avalon-framework-4.2*
	dev-java/junit
	dev-java/commons-logging
	dev-java/junitperf
	dev-java/excalibur-thread"
DEPEND="${RDEPEND}"

S=${WORKDIR}

EXCALIBUR_JAR_FROM="avalon-framework-4.2 commons-logging jetty-5 tomcat-jasper-2 plexus-component-api excalibur-thread cornerstone-threads cornerstone-sockets"

EXCALIBUR_TEST_JAR_FROM="junit junitperf"

src_unpack(){
	excalibur-multi_src_unpack "${FILESDIR}/build.xml.patch"
}
