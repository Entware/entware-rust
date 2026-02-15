# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

# all (openssl)

include $(TOPDIR)/rules.mk

PKG_NAME:=openssl-probe
PKG_VERSION:=0.1.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/alexcrichton/openssl-probe/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=66f5af9ac6219b25a2204691c481f92b9e56a2d5c5e49fc63d103b78c7b4211f

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
Build/InstallDev:=:

$(eval $(call BuildPackage,openssl-probe-$(PKG_VERSION)))
