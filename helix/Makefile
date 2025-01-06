# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=helix
PKG_VERSION:=24.07
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/helix-editor/helix/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=0f466ed2de039a7eca6faf29fc0db712c92e1a59d0bdc7e8916c717ceee8b3b3

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 gitoxide-0360 nucleo-021

define Package/helix
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Editors
  TITLE:=A post-modern modal text editor
  URL:=https://helix-editor.com
  DEPENDS:=+libstdcpp
endef

define Package/helix/description
  A Kakoune/Neovim inspired editor, written in Rust.
endef

define Package/helix/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hx $(1)/opt/usr/bin
	$(INSTALL_DIR) $(1)/opt/share/helix
	$(CP) $(PKG_BUILD_DIR)/runtime $(1)/opt/share/helix
	rm -fr $(1)/opt/share/helix/runtime/grammars/sources
endef

define Package/helix/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "create a symlink in \$$HOME, e.g.:"
printf "\t$$ansi_white %s $$ansi_std\n\n" "ln -nsf /opt/share/helix ~/.config/helix"
endef

$(eval $(call BuildPackage,helix))
