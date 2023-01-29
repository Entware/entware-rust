# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=bingrep
PKG_VERSION:=0.10.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/m4b/bingrep/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=089c9c0fdc05971a10e7463629e6fa850bd681b83ad66745d0cb78041c4a81a8

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/bingrep
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Cross-platform binary parser and colorizer
  URL:=https://github.com/m4b/bingrep
endef

define Package/bingrep/description
  Greps through binaries from various OSs and architectures, and colors them.
endef

define Package/bingrep/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/bingrep $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,bingrep))
