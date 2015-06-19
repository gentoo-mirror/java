# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_MAVEN_BOOTSTRAP="Y"
inherit java-maven-2

HOMEPAGE="http://maven.apache.org/wagon/"
DESCRIPTION="A simple API for transfering resources (artifacts) to and from repositories"
# svn co http://svn.apache.org/repos/asf/maven/wagon/tags/*/wagon-provider-api/ wagon-provider-api
SRC_URI="http://dev.gentooexperimental.org/~kiorky/${P}.tar.bz2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="source doc"
LICENSE="Apache-2.0"
DEP="
>=dev-java/plexus-utils-1.4.7_pre20071021
dev-java/plexus-interactivity-api
dev-java/wagon-provider-api
"
DEPEND=">=virtual/jdk-1.4 ${DEP}"
RDEPEND=">=virtual/jre-1.4 ${DEP}"
JAVA_MAVEN_CLASSPATH="
plexus-utils-1.4.7
plexus-interactivity-api
wagon-provider-api
"

