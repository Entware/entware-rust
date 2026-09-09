# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=zoxide
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/ajeetdsouza/zoxide/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=4fcd4272b013a10b637dbcc299c58a9924b94470a9042677ca1a204cc2e9150e

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += getrandom-0217 getrandom-042

define Package/zoxide
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A smarter cd command for your terminal
  URL:=https://github.com/ajeetdsouza/zoxide
  EXTRA_DEPENDS:=fzf
endef

define Package/zoxide/description
  zoxide is a smarter cd command, inspired by z and autojump. It
  remembers which directories you use most frequently, so you can "jump" to
  them in just a few keystrokes.
endef

define Package/zoxide/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/zoxide $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,zoxide))
