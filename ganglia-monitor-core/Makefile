# $NetBSD: Makefile,v 1.9 2015/04/06 20:57:30 outpaddling Exp $

###########################################################
#               Generated by fbsd2pkg                     #
###########################################################

PKGNAME=	ganglia-monitor-core-${PORTVERSION}
DISTNAME=	ganglia-${PORTVERSION}
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=ganglia/}

MAINTAINER=	bacon@NetBSD.org

COMMENT=	Ganglia cluster monitor, monitoring daemon
LICENSE=	modified-bsd

SET_LIBDIR=		yes

USE_LANGUAGES=	c
USE_TOOLS+=	pkg-config
USE_LIBTOOL=	yes
GNU_CONFIGURE=	yes

SUBST_CLASSES+=			pkg_sysconfdir
SUBST_STAGE.pkg_sysconfdir=	pre-configure
SUBST_MESSAGE.pkg_sysconfdir=	Fixing PKG_SYSCONFDIR
SUBST_FILES.pkg_sysconfdir=	ganglia.html				\
				gmetad/cmdline.c gmetad/cmdline.h	\
				gmetric/cmdline.c gmetric/cmdline.h	\
				gmond/cmdline.c gmond/cmdline.h		\
				gmond/g25_config.h gmond/gmond.conf.5	\
				gmond/modules/conf.d/modpython.conf	\
				gmond/modules/conf.d/modpython.conf.in	\
				gmond/modules/python/README.in		\
				mans/gmetad.1 mans/gmetric.1 mans/gmond.1
SUBST_SED.pkg_sysconfdir+=	-e 's|/etc/ganglia|${PKG_SYSCONFDIR}|g'
SUBST_SED.pkg_sysconfdir+=	-e 's|/usr/lib/ganglia|${PREFIX}/lib/ganglia|g'

## gmond.conf.5 and gmond.conf.html can be generated from conf.pod, but
## doing so requires perl installed in the build stage.
SUBST_CLASSES+=		etcdir
SUBST_STAGE.etcdir=	post-patch
SUBST_FILES.etcdir=	${WRKSRC}/README \
			${WRKSRC}/mans/gmetad.1 \
			${WRKSRC}/mans/gmond.1
SUBST_SED.etcdir=	-e "s|/etc/ganglia/\(gm.*d\.conf\)|${PREFIX}/etc/\1|g"

SUBST_CLASSES+=		linux_init
SUBST_STAGE.linux_init=	post-patch
SUBST_FILES.linux_init=	gmetad/gmetad.init gmond/gmond.init
SUBST_SED.linux_init=	-e 's|/usr/sbin|${PREFIX}/sbin|g'

CONFIGURE_ENV=		GANGLIA_ACK_SYSCONFDIR=1

CONFIGURE_ARGS+=	--with-gmetad \
			--with-python=${PYTHONBIN} \
			--sysconfdir=${PREFIX}/etc

CFLAGS+=	-I${LOCALBASE}/include

PORTVERSION=	3.6.0
DATADIR=	${PREFIX}/share/ganglia-monitor-core
DOCSDIR=	${PREFIX}/share/doc/ganglia-monitor-core
EXAMPLESDIR=	${PREFIX}/share/examples/ganglia-monitor-core

# You may need this, especially if using do-install.
#AUTO_MKDIRS=	yes

RCD_SCRIPTS=		gmond gmetad

post-build:
	${WRKSRC}/gmond/gmond -t > ${WRKDIR}/gmond.conf

post-install:
	${INSTALL_SCRIPT} ${FILESDIR}/gmetasnap.sh \
		${DESTDIR}${PREFIX}/sbin/gmetasnap
	${INSTALL_MAN} ${WRKSRC}/mans/gmetad.1 ${DESTDIR}${PREFIX}/man/man1
	${MKDIR} ${DESTDIR}${PREFIX}/etc
	${MKDIR} ${DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKDIR}/gmond.conf \
		${DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/gmetad/gmetad.conf \
		${DESTDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/gmond/gmond.init \
		${DESTDIR}${EXAMPLESDIR}/gmond.init.linux
	${INSTALL_SCRIPT} ${WRKSRC}/gmetad/gmetad.init \
		${DESTDIR}${EXAMPLESDIR}/gmetad.init.linux
	${INSTALL_MAN} \
		${WRKSRC}/mans/gmetric.1 \
		${WRKSRC}/mans/gmond.1 \
		${WRKSRC}/mans/gstat.1 \
		${DESTDIR}${PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/gmond/gmond.conf.5 \
		${DESTDIR}${PREFIX}/man/man5
	${MKDIR} ${DESTDIR}${PREFIX}/lib/ganglia/python_modules

# Add any _DEPENDS that have a buildlink3.mk
.include "../../devel/apr/buildlink3.mk"
.include "../../devel/confuse/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../databases/rrdtool/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
