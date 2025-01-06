# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=joshuto
PKG_VERSION:=0.9.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kamiyaa/joshuto/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=877d841b2e26d26d0f0f2e6f1dab3ea2fdda38c345abcd25085a3f659c24e013

PKG_LICENSE:=LGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438

define Package/joshuto
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Terminal
  TITLE:=ranger-like terminal file manager written in Rust
  URL:=https://github.com/kamiyaa/joshuto
  EXTRA_DEPENDS:=bash, file, fzf, perl-image-exiftool
endef

define Package/joshuto/description
  Terminal file manager inspired by ranger.
endef

define Package/joshuto/conffiles
/opt/etc/joshuto/bookmarks.toml
/opt/etc/joshuto/icons.toml
/opt/etc/joshuto/joshuto.toml
/opt/etc/joshuto/keymap.toml
/opt/etc/joshuto/mimetype.toml
/opt/etc/joshuto/theme.toml
endef

define Package/joshuto/install
	$(INSTALL_DIR) $(1)/opt/etc/joshuto
	$(CP) $(PKG_BUILD_DIR)/config/*.toml $(1)/opt/etc/joshuto
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/config/*.sh $(1)/opt/etc/joshuto
	$(SED) 's,^#!.*bash,#!/opt/bin/bash,' $(1)/opt/etc/joshuto/preview_file.sh
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/joshuto $(1)/opt/usr/bin
endef

define Package/joshuto/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "create a symlink in \$$HOME, e.g.:"
printf "\t$$ansi_white %s $$ansi_std\n\n" "ln -nsf /opt/etc/joshuto ~/.config/"
endef

$(eval $(call BuildPackage,joshuto))
