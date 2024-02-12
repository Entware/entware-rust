# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=taskwarrior-tui
PKG_VERSION:=0.25.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kdheepak/taskwarrior-tui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=86a00c0c33f825824ac432c50e57a9bac150c3ba9e3d06e6d86f65790a99a458

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/taskwarrior-tui
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A Taskwarrior Terminal User Interface
  URL:=https://kdheepak.com/taskwarrior-tui
  EXTRA_DEPENDS:=taskwarrior
endef

define Package/taskwarrior-tui/description
  A Terminal User Interface (TUI) for Taskwarrior that you didn't know you wanted.
endef

define Package/taskwarrior-tui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/taskwarrior-tui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,taskwarrior-tui))
