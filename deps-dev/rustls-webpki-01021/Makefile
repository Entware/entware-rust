# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rustls-webpki
PKG_VERSION:=0.102.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/rustls/webpki/tar.gz/refs/tags/v/$(PKG_VERSION)?
PKG_HASH:=fd4f58f7ac8b02c3436568029a3ed0a187c1a98df625faac0b8d9538a2963e87

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += rcgen-0120 ring-0177
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/rustls-webpki-$(PKG_VERSION)
  SECTION:=devel
  CATEGORY:=Development
  SUBMENU:=Libraries
  TITLE:=Web PKI X.509 Certificate Verification
  URL:=https://github.com/rustls/webpki
  BUILDONLY:=1
endef

define Package/rustls-webpki-$(PKG_VERSION)/description
  WebPKI X.509 Certificate Validation in Rust.
endef

Build/Compile:=:
MoveLibs:=:
Build/InstallDev:=:

# XXX 4checking
#define Package/$(PKG_NAME)-$(PKG_VERSION)/install
#	$(INSTALL_DIR) $(1)/opt/tmp
#endef
 
$(eval $(call BuildPackage,rustls-webpki-$(PKG_VERSION)))
