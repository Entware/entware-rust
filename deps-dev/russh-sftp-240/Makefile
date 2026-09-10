# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# XXX mips(el) (hex-patch, termscp)

include $(TOPDIR)/rules.mk

PKG_NAME:=russh-sftp
PKG_VERSION:=2.4.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=e145c1f7ece99f41f558949ef59731f2cd1a9dfe
PKG_SOURCE_URL:=https://github.com/AspectUnk/russh-sftp
PKG_MIRROR_HASH:=55170c1bf63d762514794df62c2d1fe3b7b3b6703c9391fd17aa5ca9384b6800

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0445 getrandom-0217

define Package/russh-sftp-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=SFTP subsystem supported server and client for Russh
  URL:=https://github.com/AspectUnk/russh-sftp
  BUILDONLY:=1
endef

define Package/russh-sftp-$(PKG_VERSION)/description
  SFTP subsystem supported server and client for Russh and more!
endef

Build/Compile:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,russh-sftp-$(PKG_VERSION)))
