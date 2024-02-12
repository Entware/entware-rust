# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips:
#	error: failed to run custom build command for `ring v0.17.5`

include $(TOPDIR)/rules.mk

PKG_NAME:=wstunnel
PKG_VERSION:=9.2.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/erebe/wstunnel/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=0ff3d7577127ca79e90ce973a19773753bdca545da2f749b86c0f230f14f009b

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += ring-0175

define Package/wstunnel
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Tunneling over websocket protocol
  URL:=https://github.com/erebe/wstunnel
  DEPENDS:=+ca-certificates
endef

define Package/wstunnel/description
  Tunneling over websocket protocol.
endef

define Package/wstunnel/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/wstunnel $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,wstunnel))
