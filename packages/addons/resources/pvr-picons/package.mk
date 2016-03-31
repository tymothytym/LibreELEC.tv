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

PKG_NAME="pvr-picons"
PKG_VERSION="2016-03-29"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="other"
PKG_SITE="https://github.com/picons/picons-source"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="resource.images"
PKG_SHORTDESC="Picons: channellogos for Tvheadend and VDR."
PKG_LONGDESC="Picons are small images that represents the service logo.\n\nThey could be displayed on several parts of the Kodi skin, which make your OSD more enjoyable."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Picons for PVR"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_ADDON_REPOVERSION="7.0"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/logos
  cp $PKG_BUILD/*.png $ADDON_BUILD/$PKG_ADDON_ID/logos
}
