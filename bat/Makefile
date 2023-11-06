# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=bat
PKG_VERSION:=0.24.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/sharkdp/bat/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=907554a9eff239f256ee8fe05a922aad84febe4fe10a499def72a4557e9eedfb

PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/bat
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=a cat(1) clone with wings
  URL:=https://github.com/sharkdp/bat
  DEPENDS:=+zlib
endef

define Package/bat/description
  A cat(1) clone with syntax highlighting and Git integration.
endef

define Package/bat/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bat $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bat))
