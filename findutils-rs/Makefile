# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=findutils-rs
PKG_VERSION:=0.3.0
PKG_RELEASE:=5

PKG_SOURCE_DATE:=2023-02-24
PKG_SOURCE_VERSION:=a3287a978f66723aacb704de159aceff0d0f5a86

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/uutils/findutils
PKG_MIRROR_HASH:=2c135f9c554af304250c4dff9d6aab46fa27b4d40ae2dd5661b7adc9b75466b2

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
