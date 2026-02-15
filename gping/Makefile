# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=gping
PKG_VERSION:=1.20.1
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/orf/gping/tar.gz/refs/tags/$(PKG_NAME)-v$(PKG_VERSION)?
PKG_HASH:=0df965111429d5fcef832a4ff23b452a1ec8f683d51ed31ce9b10902c0a18a9c

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0441 getrandom-033 iana-time-zone-0163
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/gping
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ping written in Rust
  URL:=https://github.com/orf/gping
  EXTRA_DEPENDS:=iputils-ping
endef

define Package/gping/description
  Ping, but with a graph.
endef

define Package/gping/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/gping $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,gping))
