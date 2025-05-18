# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=hex-patch
PKG_VERSION:=1.11.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Etto48/HexPatch/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=167ce16be5e2162a0ce552e3df69b736febfbfaf6c1b805409230c57b620eb88

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 flurry-051 russh-sftp-208 seize-033
PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/hex-patch
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=a binary patcher and editor with TUI
  URL:=https://etto48.github.io/HexPatch/
  DEPENDS:=+libstdcpp
endef

define Package/hex-patch/description
  HexPatch is a binary patcher and editor with terminal user
  interface (TUI), it's capable of disassembling instructions and assembling
  patches. It supports a variety of architectures and file formats. Also, it
  can edit remote files via SSH.
endef

define Package/hex-patch/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hex-patch $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,hex-patch))
