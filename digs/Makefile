# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=digs
PKG_VERSION:=0.4.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/BiznetGIO/digs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=f1d3c65d268c6a74dfb3beadb14cd04c7fb51a26ba0ad779c38c3b61e6fc68e9

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/digs
  SECTION:=net
  CATEGORY:=Network
  TITLE:=dig many at once
  URL:=https://github.com/BiznetGIO/digs
endef

define Package/digs/description
  digs is a DNS command-line client that able to query many DNS
  servers at once.
endef

define Package/digs/conffiles
/opt/etc/digs.toml
endef

define Package/digs/install
	$(INSTALL_DIR) $(1)/opt/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/tests/fixture/digs.toml $(1)/opt/etc
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/digs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,digs))
