TERMUX_PKG_HOMEPAGE=https://www.gnutls.org/
TERMUX_PKG_DESCRIPTION="Secure communications library implementing the SSL, TLS and DTLS protocols and technologies around them"
TERMUX_PKG_LICENSE="LGPL-2.1, GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
_MAJOR_VERSION=3.8
TERMUX_PKG_VERSION=${_MAJOR_VERSION}.0
TERMUX_PKG_SRCURL=https://www.gnupg.org/ftp/gcrypt/gnutls/v${_MAJOR_VERSION}/gnutls-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5
TERMUX_PKG_DEPENDS="brotli, libc++, libgmp, libnettle, ca-certificates, libidn2, libunistring, unbound"
TERMUX_PKG_BREAKS="libgnutls-dev"
TERMUX_PKG_REPLACES="libgnutls-dev"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--enable-cxx
--disable-hardware-acceleration
--disable-openssl-compatibility
--with-default-trust-store-file=$TERMUX_PREFIX/etc/tls/cert.pem
--with-system-priority-file=${TERMUX_PREFIX}/etc/gnutls/default-priorities
--with-unbound-root-key-file=$TERMUX_PREFIX/etc/unbound/root.key
--with-included-libtasn1
--enable-local-libopts
--without-p11-kit
--disable-guile
--disable-doc
"

termux_step_post_get_source() {
	# Do not forget to bump revision of reverse dependencies and rebuild them
	# after SOVERSION is changed.
	local _SOVERSION=30

	local a
	for a in LT_CURRENT LT_AGE; do
		local _${a}=$(sed -En 's/^\s*AC_SUBST\('"${a}"',\s*([0-9]+).*/\1/p' \
				m4/hooks.m4)
	done
	local v=$(( _LT_CURRENT - _LT_AGE ))
	if [ ! "${_LT_CURRENT}" ] || [ "${v}" != "${_SOVERSION}" ]; then
		termux_error_exit "SOVERSION guard check failed."
	fi
}

termux_step_pre_configure() {
	CFLAGS+=" -DNO_INLINE_GETPASS=1"
}
