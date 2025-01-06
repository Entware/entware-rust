# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=hyperfine
PKG_VERSION:=1.19.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sharkdp/hyperfine/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=d1c782a54b9ebcdc1dedf8356a25ee11e11099a664a7d9413fdd3742138fa140

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

define Package/hyperfine
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A command-line benchmarking tool
  URL:=https://github.com/sharkdp/hyperfine
endef

define Package/hyperfine/description
  A command-line benchmarking tool.
endef

define Package/hyperfine/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hyperfine $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,hyperfine))
