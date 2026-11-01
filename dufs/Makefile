# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=dufs
PKG_VERSION:=0.46.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sigoden/dufs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=e5bb926107736802bfd3be6937482dd3daf396a5c481fed714de542055286ebc

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0444 getrandom-0217 getrandom-034 getrandom-042 iana-time-zone-0164

define Package/dufs
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Filesystem
  TITLE:=a distinctive utility file server
  URL:=https://github.com/sigoden/dufs
  DEPENDS:=+liblzma
endef

define Package/dufs/description
  Dufs is a distinctive utility file server that supports static
  serving, uploading, searching, accessing control, webdav...
endef

define Package/dufs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/dufs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,dufs))
