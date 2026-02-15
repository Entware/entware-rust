# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=ouch
PKG_VERSION:=0.6.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ouch-org/ouch/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=e6265071affab228ba7d3ca85f2206029445038b3a3d96036e9bf02b795ad651

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0441 getrandom-0215 getrandom-031

define Package/ouch
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Compression
  TITLE:=Painless compression and decompression
  URL:=https://github.com/ouch-org/ouch
  DEPENDS:=+liblzma +libstdcpp +libzstd +zlib
endef

define Package/ouch/description
  A command-line utility for easily compressing and decompressing
  files and directories.
endef

RUSTFLAGS += -l dylib=zstd

define Package/ouch/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ouch $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,ouch))
