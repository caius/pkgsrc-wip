# $NetBSD$

###########################################################
#               Generated by fbsd2pkg                     #
###########################################################

DISTNAME=	cdbfasta-${PORTVERSION}
CATEGORIES=	biology
MASTER_SITES=	http://acadix.biz/Ports/distfiles/

MAINTAINER=	bacon@NetBSD.org

COMMENT=	Fast indexing and retrieval of fasta records from flat file databases
# LICENSE=	Unspecified

# Pessimistic assumption.  Test and change if possible.
MAKE_JOBS_SAFE=	no

# Just assuming C and C++: Adjust this!
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake

WRKSRC=		${WRKDIR}/cdbfasta

PORTVERSION=	2010.07.22

AUTO_MKDIRS=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cdbfasta ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/cdbyank ${DESTDIR}${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
