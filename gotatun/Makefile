# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=gotatun
PKG_VERSION:=0.1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mullvad/gotatun/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=360ce5609e609ce8fcae5268773e041de096440962cf8df20f479e30307f2d35

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
