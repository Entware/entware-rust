# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=ratatui-snake
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_GIT_TAG:=v$(subst $(space),.,$(wordlist 1,2,$(subst .,$(space),$(PKG_VERSION))))

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kriskw1999/ratatui-snake/tar.gz/refs/tags/$(PKG_GIT_TAG)?
PKG_HASH:=14d307262e37d353ab44706e6698209263fd38df9ec762c6eee4e045e2eadb0c

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/ratatui-snake
  SECTION:=games
  CATEGORY:=Games
  TITLE:=Ratatui Snake
  URL:=https://github.com/kriskw1999/ratatui-snake
endef

define Package/ratatui-snake/description
  This is a simple snake game made designed using Ratatui as TUI
  library and Rust as programming language.
endef

define Package/ratatui-snake/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/ratatui-snake $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,ratatui-snake))
