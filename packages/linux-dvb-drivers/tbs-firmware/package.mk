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

PKG_NAME="tbs-firmware"
PKG_VERSION="160405"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Free-to-use"
PKG_SITE="http://www.tbsdtv.com/english/Download.html"
PKG_URL="http://www.tbsdtv.com/download/document/common/tbs-linux-drivers_v${PKG_VERSION}.zip"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="firmware"
PKG_SHORTDESC="dvb-firmware: firmwares for various DVB drivers"
PKG_LONGDESC="dvb-firmware: firmwares for various DVB drivers"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  unzip -q $ROOT/$SOURCES/$PKG_NAME/$PKG_SOURCE_NAME -d $ROOT/$BUILD/$PKG_NAME-$PKG_VERSION
}

post_unpack() {
  tar xjf $ROOT/$PKG_BUILD/linux-tbs-drivers.tar.bz2 -C $ROOT/$PKG_BUILD
  chmod -R u+rwX $ROOT/$PKG_BUILD/linux-tbs-drivers/*
}

make_target() {
  cd $ROOT/$PKG_BUILD/linux-tbs-drivers
}

makeinstall_target() {
  mkdir -p $INSTALL/lib/firmware/
  cp $ROOT/$PKG_BUILD/*.fw $INSTALL/lib/firmware/
}
