################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="x11vnc"
PKG_VERSION="74fc679"
PKG_REV="100"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/LibVNC/x11vnc"
PKG_URL="https://github.com/LibVNC/x11vnc/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libvncserver libX11 libXext libXtst libressl"
PKG_PRIORITY="optional"
PKG_SECTION="service"
PKG_SHORTDESC="x11vnc: a VNC server for Linux"
PKG_LONGDESC="x11vnc (0.9.13): allows remote access from a remote client to a computer hosting an X Window session"
PKG_AUTORECONF="yes"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="x11vnc"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REPOVERSION="7.0"

PKG_CONFIGURE_OPTS_TARGET="--with-x \
      --without-xkeyboard \
      --without-xinerama \
      --without-xrandr \
      --without-xfixes \
      --without-xdamage \
      --without-xcomposite \
      --without-xtrap \
      --without-xrecord \
      --without-fbpm \
      --without-dpms \
      --without-v4l \
      --without-fbdev \
      --without-uinput \
      --without-macosx-native \
      --without-colormultipointer"

pre_configure_target() {
  export LIBS="$LIBS -lpthread -lresolv -lz -ljpeg -lpng"
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp -P $PKG_BUILD/.$TARGET_NAME/src/x11vnc $ADDON_BUILD/$PKG_ADDON_ID/bin
}
