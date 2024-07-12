# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rustube
PKG_VERSION:=0.6.0
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/DzenanJupic/rustube/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=85bc135be9a5931fef93c97b2ab9120fdd8110f5a2e847fd2962603b5199c8e5

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

define Package/rustube
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=A CLI for rustube
  URL:=https://github.com/DzenanJupic/rustube
  DEPENDS:=+libopenssl
endef

define Package/rustube/description
  A YouTube video downloader, originally inspired by pytube, written
  in Rust.
endef

CARGO_SOURCE_SUBDIR:=cli

define Package/rustube/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rustube $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rustube))
