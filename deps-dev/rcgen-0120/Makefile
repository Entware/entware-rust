# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rcgen
PKG_VERSION:=0.12.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/rcgen/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=d225775002d8006ff9ab35f1a4828378897930a8d5771f999d0c9fc2a2773b50

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += ring-0175 rustls-webpki-01017

define Package/rcgen-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Rust X.509 certificate generator
  URL:=https://github.com/rustls/rcgen
  BUILDONLY:=1
endef

define Package/rcgen-$(PKG_VERSION)/description
  Generate X.509 certificates.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,rcgen-$(PKG_VERSION)))
