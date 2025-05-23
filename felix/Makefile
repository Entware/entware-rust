# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=felix
PKG_VERSION:=2.16.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kyoheiu/felix/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=a001dfe81cdbdfa19ba653a4711a17e4c92aa528139739c895df5791a26ea9f5

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 getrandom-0215 iana-time-zone-0163

define Package/felix
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=tui file manager with vim-like key mapping
  URL:=https://github.com/kyoheiu/felix
  DEPENDS:=+liblzma +zlib
endef

define Package/felix/description
  A tui file manager with Vim-like key mapping, written in Rust.
endef

define Package/felix/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/fx $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,felix))
