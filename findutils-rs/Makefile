# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=findutils-rs
PKG_VERSION:=0.3.0
PKG_RELEASE:=3
PKG_SOURCE_DATE:=2022-08-17
PKG_SOURCE_VERSION:=45632896896b9b13eb4bc6646e6dcdcf013fdd8c

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/uutils/findutils
PKG_MIRROR_HASH:=b80e9cd544cc39f61bf9040b20de2b77f69bcf384d8f979b4b83025fffd617b7

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
