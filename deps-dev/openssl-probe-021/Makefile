# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2026 Entware

# all (openssl)

include $(TOPDIR)/rules.mk

PKG_NAME:=openssl-probe
PKG_VERSION:=0.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/alexcrichton/openssl-probe/tar.gz/$(PKG_VERSION)?
PKG_HASH:=3738109d85b6b7c8e043a8a9069f81be5b299b87d6c059813c98e9954616e917

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
