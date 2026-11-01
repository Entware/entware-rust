# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=digs
PKG_VERSION:=0.4.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/BiznetGIO/digs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=0e652045800721fea8ee7c879440702e7c60af99ebef848562ca98617e01dad5

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
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/examples/config.toml $(1)/opt/etc/digs.toml
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/digs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,digs))
