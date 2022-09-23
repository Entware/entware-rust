# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=procs
PKG_VERSION:=0.13.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/dalance/procs/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=29a5058f8389986e5b17117d3ee4f78a2bf9c8886e07b16a49a94e5fc59a6850

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/procs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A modern replacement for ps
  URL:=https://github.com/dalance/procs
endef

define Package/procs/description
  procs is a replacement for ps written in Rust.
endef

define Package/procs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/procs $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,procs))
