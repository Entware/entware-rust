# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# XXX mips(el) (uv)

include $(TOPDIR)/rules.mk

PKG_NAME:=boxcar
PKG_VERSION:=0.2.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ibraheemdev/boxcar/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=3ad9ebadbfe24771d12ab0b2e9b1db018173433dfd4df62ecf9699d4ac8eccd3

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/boxcar-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=a concurrent, append-only vector
  URL:=https://github.com/ibraheemdev/boxcar
  BUILDONLY:=1
endef

define Package/boxcar-$(PKG_VERSION)/description
  A concurrent, append-only vector.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,boxcar-$(PKG_VERSION)))
