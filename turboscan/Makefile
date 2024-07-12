# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=turboscan
PKG_VERSION:=0.1.4
PKG_RELEASE:=5

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-06-10
PKG_SOURCE_VERSION:=5294447e37bbd82ea8a640e5bfe516473ac2a164
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/vithalreddy/turboscan
PKG_MIRROR_HASH:=dd75be47b83dbf26719431f971db9de922a65458953bae289349a23d9eeec7bf

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/turboscan
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A fast and reliable Rust-based port scanner CLI
  URL:=https://github.com/vithalreddy/turboscan
endef

define Package/turboscan/description
  Turboscan is a blazingly fast and reliable Rust-based port scanner
  CLI for network administrators, security professionals and Developers.
endef

define Package/turboscan/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/turboscan $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,turboscan))
