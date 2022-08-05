# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=bingrep
PKG_VERSION:=0.10.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/m4b/bingrep/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=3bc4ebaf179d72b82277e7130d44c15e2cc646d388124d0acdb2ca5f33e93af6

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
