# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="source"

JAVA_MAVEN_BOOTSTRAP="Y"
inherit java-maven-2

DESCRIPTION="The Plexus project provides a full software stack for creating and executing software projects."
HOMEPAGE="http://plexus.codehaus.org/"
SRC_URI="http://dev.gentooexperimental.org/~kiorky/${P}.tar.bz2"
LICENSE="as-is" # http://plexus.codehaus.org/plexus-utils/license.html
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEP="
=dev-java/plexus-classworlds-1.2*
>=dev-java/plexus-utils-1.4.7_pre20071021
>=dev-java/plexus-component-api-1.0_alpha33_pre20071021
dev-java/junit
"
DEPEND=">=virtual/jdk-1.4 ${DEP}"
RDEPEND=">=virtual/jre-1.4 ${DEP}"
JAVA_MAVEN_CLASSPATH="
plexus-classworlds
plexus-utils-1.4.7
junit
plexus-component-api-1.0_alpha33
"

