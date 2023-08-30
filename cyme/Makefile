# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=cyme
PKG_VERSION:=1.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/tuna-f1sh/cyme/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=a456cd0022a0bcee0a72f3e0dd3281ab115c6429ef22eaecb4ccb8f5844845b2

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/cyme
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=List system USB buses and devices
  URL:=https://github.com/tuna-f1sh/cyme
  DEPENDS:=+libudev-zero
endef

define Package/cyme/description
  List system USB buses and devices; a lib and modern cross-platform lsusb
  that attempts to maintain compatibility with, but also add new features.
endef

define Package/cyme/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/cyme $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,cyme))
