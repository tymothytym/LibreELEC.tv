################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="minisatip"
PKG_VERSION="42f5d4a"
PKG_REV="91"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/catalinii/minisatip"
PKG_URL="https://github.com/catalinii/minisatip/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="minisatip-${PKG_VERSION}*"
PKG_DEPENDS_TARGET="toolchain dvb-apps libdvbcsa"
PKG_PRIORITY="optional"
PKG_SECTION="service"
PKG_SHORTDESC="minisatip: a Sat>IP streaming server for Linux"
PKG_LONGDESC="minisatip($PKG_VERSION): is a Sat>IP streaming server for Linux supporting DVB-S/S2, DVB-C, DVB-T/T2"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Minisatip"
PKG_ADDON_TYPE="xbmc.service"
PKG_AUTORECONF="no"
PKG_ADDON_REPOVERSION="7.0"

make_target() {
    DVB_APPS_DIR=$(get_build_dir dvb-apps)

    make CC=$TARGET_CC \
    CFLAGS="$CFLAGS -I$DVB_APPS_DIR/lib" \
    LDFLAGS="$LDFLAGS $DVB_APPS_DIR/lib/libdvben50221/libdvben50221.a \
             $DVB_APPS_DIR/lib/libucsi/libucsi.a \
             $DVB_APPS_DIR/lib/libdvbapi/libdvbapi.a \
             $SYSROOT_PREFIX/usr/lib/libdvbcsa.a -lpthread" \
    DVBCSA=yes \
    DVBCA=yes
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -P $PKG_BUILD/minisatip $ADDON_BUILD/$PKG_ADDON_ID/bin
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/webif
  cp -PR $PKG_BUILD/html/* $ADDON_BUILD/$PKG_ADDON_ID/webif
}
