PKG_NAME="bash"
PKG_VERSION="4.3.30"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://ftp.gnu.org"
PKG_URL="https://ftp.gnu.org/gnu/bash/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain yasm:host"
PKG_PRIORITY="optional"
PKG_SECTION="system"
PKG_SHORTDESC="Bash is installed to /bin/bash.real"
PKG_LONGDESC="Bash is a Unix shell written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
    cd $ROOT/$PKG_BUILD
    ./configure --host=$TARGET_ARCH
}

makeinstall_target() {
    mkdir -p $INSTALL/bin
    cp bash $INSTALL/bin/bash.real
}

