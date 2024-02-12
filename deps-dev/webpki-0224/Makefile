# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=webpki
PKG_VERSION:=0.22.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-10-09
PKG_SOURCE_VERSION:=f84a538a5cd281ba1ffc0d54bbe5824cf5969703
PKG_SOURCE_URL:=https://github.com/briansmith/webpki
PKG_MIRROR_HASH:=b1a2a1852615c6e3d785b7c19e69e01b6ff1cd149fa3fa5b6cc6a48dbd9e4366

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += rcgen-0113 ring-0175

define Package/webpki-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=WebPKI X.509 Certificate Validation in Rust
  URL:=https://github.com/briansmith/webpki
  BUILDONLY:=1
endef

define Package/webpki-$(PKG_VERSION)/description
  Web PKI X.509 Certificate Verification.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

$(eval $(call BuildPackage,webpki-$(PKG_VERSION)))
