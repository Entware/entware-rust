# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=findutils-rs
PKG_VERSION:=0.3.0
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=2defcbeacc78645e0e198e6e2145cf1bd6f1e72b
PKG_SOURCE_URL:=https://github.com/uutils/findutils.git
PKG_MIRROR_HASH:=34ebb6a0cfebdef8d28ed9a48639e5e67b2d681eae6bc95d888df4843bdc0537

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/findutils-rs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Rust implementation of GNU findutils
  URL:=https://github.com/uutils/findutils
endef

define Package/findutils-rs/description
  Rust implementation of GNU findutils.
endef

define Package/findutils-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/find $(1)/opt/usr/bin/find-rs
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/xargs $(1)/opt/usr/bin/xargs-rs
endef

$(eval $(call BuildPackage,findutils-rs))
