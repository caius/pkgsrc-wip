# $NetBSD$
VERSION=		1.4.14
PKGNAME=		mosquitto-${VERSION}
DISTNAME=		${PKGNAME}
CATEGORIES=		net
MASTER_SITES=		http://mosquitto.org/files/source/

MAINTAINER=	amoibos@gmail.com
HOMEPAGE=	http://mosquitto.org/
COMMENT=	Open Source MQTT broker
LICENSE=	eclipse-license

USE_LANGUAGES+=	c c++
USE_TOOLS+=		cmake gmake

EGDIR=			${PREFIX}/share/examples/mosquitto
CONF_FILES=		${EGDIR}/mosquitto.conf ${PKG_SYSCONFDIR}/mosquitto.conf
INSTALLATION_DIRS+=	${EGDIR}
CHECK_SHLIBS_SKIP=	lib/libmosquittopp.so.1
RCD_SCRIPTS+=		mosquitto

CHECK_SHLIBS_SKIP=	lib/libmosquittopp.so.1

post-install:
	chmod -x ${DESTDIR}${PREFIX}/include/mosquitto.h \
		${DESTDIR}${PREFIX}/include/mosquittopp.h \
		${DESTDIR}${PREFIX}/include/mosquitto_plugin.h
	mkdir ${DESTDIR}${PREFIX}/share/examples/mosquitto
	${INSTALL_DATA}	${WRKSRC}/pskfile.example \
		${WRKSRC}/pwfile.example \
		${WRKSRC}/mosquitto.conf \
		${WRKSRC}/aclfile.example\
		${DESTDIR}${PREFIX}/share/examples/mosquitto

.include "../../net/libcares/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
