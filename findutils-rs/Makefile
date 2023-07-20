# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=findutils
PKG_VERSION:=0.4.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/uutils/findutils/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=6d6361a46e59c43b7bb2a5ba358868c6d11c060a316e6a9dade63ab5138bdda6

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/findutils-rs
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Rust implementation of GNU findutils
  URL:=https://github.com/uutils/findutils
endef

define Package/findutils-rs/description
  Rust implementation of GNU findutils.
endef

define Package/findutils-rs/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/{find,xargs} $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,findutils-rs))
