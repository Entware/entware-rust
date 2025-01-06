# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# arm/mips(el):
#	error: Unsupported target
#	--> .../index.crates.io-*/corosensei-0.1.4/src/arch/mod.rs:169:9

include $(TOPDIR)/rules.mk

PKG_NAME:=zellij
PKG_VERSION:=0.41.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/zellij-org/zellij/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=12e7f0f80c1e39deed5638c4662fc070855cee0250a7eb1d76cefbeef8c2f376

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/zellij
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Terminal
  TITLE:=A terminal workspace with batteries included
  URL:=https://zellij.dev
  DEPENDS:=@ARCH_64BIT +libcurl +libopenssl +zlib
endef

define Package/zellij/description
  A terminal workspace with batteries included.
endef

define Package/zellij/conffiles
/opt/etc/zellij/config.kdl
endef

# error: failed to run custom build command for `openssl-sys v0.9.98`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

define Package/zellij/install
	$(INSTALL_DIR) $(1)/opt/etc/zellij
	$(CP) $(PKG_BUILD_DIR)/example/* $(1)/opt/etc/zellij
	$(CP) $(PKG_BUILD_DIR)/zellij-utils/assets/layouts $(1)/opt/etc/zellij
	$(CP) $(PKG_BUILD_DIR)/zellij-utils/assets/themes $(1)/opt/etc/zellij
	$(INSTALL_DIR) $(1)/opt/share/zellij
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/zellij $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,zellij))
