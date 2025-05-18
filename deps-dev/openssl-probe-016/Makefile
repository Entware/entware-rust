# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025 Entware

# all (openssl)

include $(TOPDIR)/rules.mk

PKG_NAME:=openssl-probe
PKG_VERSION:=0.1.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/alexcrichton/openssl-probe/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=86247620c6b446f32d7401575dfeb62e953a9bf6fb32734506f6c5a7a10fb85d

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

define Package/openssl-probe-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Tools for helping to find SSL certificate locations
  URL:=https://github.com/alexcrichton/openssl-probe
  BUILDONLY:=1
endef

define Package/openssl-probe-$(PKG_VERSION)/description
  Tool for helping to find SSL certificate locations on the system for OpenSSL.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,openssl-probe-$(PKG_VERSION)))
