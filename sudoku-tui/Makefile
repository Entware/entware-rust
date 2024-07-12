# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=sudoku-tui
PKG_VERSION:=0.2.0
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/TianyiShi2001/sudoku-tui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=dfb05a8ef14063f5583d7496eb11114592e1338ffe25433decdb8bc29eb88527

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/sudoku-tui
  SECTION:=games
  CATEGORY:=Games
  TITLE:=Play sudoku on the command line
  URL:=https://github.com/TianyiShi2001/sudoku-tui
endef

define Package/sudoku-tui/description
  Play sudoku on the command line. (TUI interface)
endef

define Package/sudoku-tui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/sudoku $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,sudoku-tui))
