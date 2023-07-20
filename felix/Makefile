# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=felix
PKG_VERSION:=2.5.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/kyoheiu/felix/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=7c38d7b70645e3f562632fd47753ed6b5adcc222eab50356bd7554a7d23d0269

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/felix
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=tui file manager with vim-like key mapping
  URL:=https://github.com/kyoheiu/felix
endef

define Package/felix/description
  A tui file manager with Vim-like key mapping, written in Rust.
endef

define Package/felix/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/fx $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,felix))
