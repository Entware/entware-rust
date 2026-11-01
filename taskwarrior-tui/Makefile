# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=taskwarrior-tui
PKG_VERSION:=0.27.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kdheepak/taskwarrior-tui/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=e4f5d10428dc1917b6084b5b0ed502ffe691cb14908cedd04ffff3940f9ffceb

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0444 getrandom-0217 getrandom-034 getrandom-042 iana-time-zone-0164

define Package/taskwarrior-tui
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A Taskwarrior Terminal User Interface
  URL:=https://kdheepak.com/taskwarrior-tui
  EXTRA_DEPENDS:=taskwarrior
endef

define Package/taskwarrior-tui/description
  A Terminal User Interface (TUI) for Taskwarrior that you didn't
  know you wanted.
endef

define Package/taskwarrior-tui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/taskwarrior-tui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,taskwarrior-tui))
