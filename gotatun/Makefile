# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=gotatun
PKG_VERSION:=0.4.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mullvad/gotatun/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=54b23a9627815b00278c2e1ed3be7f44e1abb75bf54a24f2aa435c8ea0529323

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0216 getrandom-034

define Package/gotatun
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  TITLE:=userspace WireGuard implementation in Rust
  URL:=https://github.com/mullvad/gotatun
endef

define Package/gotatun/description
 A userspace WireGuard® implementation, and a fork of BoringTun.
endef

define Package/gotatun/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/gotatun $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,gotatun))
