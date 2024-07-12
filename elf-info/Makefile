# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=elf-info
PKG_VERSION:=0.3.0
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kevin-lesenechal/elf-info/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=1b182c54b3e498b6a447b937725b1dc5131c5f4239c3585473cea203ef42c923

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/elf-info
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=ergonomic CLI ELF inspection tool
  URL:=https://github.com/kevin-lesenechal/elf-info
endef

define Package/elf-info/description
  elf-info can inspect and display information about ELF binaries,
  the executable format mostly used on Linux.
endef

define Package/elf-info/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/elf $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,elf-info))
