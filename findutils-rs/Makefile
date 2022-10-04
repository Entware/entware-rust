# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=findutils-rs
PKG_VERSION:=0.3.0
PKG_RELEASE:=4
PKG_SOURCE_DATE:=2022-09-21
PKG_SOURCE_VERSION:=e785397880f24e94c62c44ae9963ad9a2e7f1e07

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/uutils/findutils
PKG_MIRROR_HASH:=bc6a231ea95b1ecfa9915641161865e62e334065c751fcacc4099ee4d2bf0b40

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
