# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=minesweep-rs
PKG_VERSION:=6.0.54
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/cpcloud/minesweep-rs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=b07161bac09838307fb2f5315b11882f2b6eb20123aab74020d1c9f158183e77

PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Entware team, https://entware.net

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/minesweep-rs
  SECTION:=games
  CATEGORY:=Games
  TITLE:=A mine sweeping game written in Rust
  URL:=https://github.com/cpcloud/minesweep-rs
endef

define Package/minesweep-rs/description
  A mine sweeping game written in Rust using tui-rs.
endef

define Package/minesweep-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/minesweep $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,minesweep-rs))
