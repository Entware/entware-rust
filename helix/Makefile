# SPDX-License-Identifier: WTFPL

# TODO: add post-inst info

include $(TOPDIR)/rules.mk

PKG_NAME:=helix
PKG_VERSION:=23.03
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/helix-editor/helix/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=5f9df93c8d98fd4bd13329c0aaf978e74887a0f6022d699ff6161dcee78e8655

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../cargo.mk

define Package/helix
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Editors
  TITLE:=A post-modern modal text editor
  URL:=https://helix-editor.com/
  DEPENDS:=+libstdcpp
endef

define Package/helix/description
  A Kakoune / Neovim inspired editor, written in Rust.
endef

define Package/helix/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/hx $(1)/opt/usr/bin

	$(INSTALL_DIR) $(1)/opt/share/helix
	$(CP) $(PKG_BUILD_DIR)/runtime $(1)/opt/share/helix
	rm -fr $(1)/opt/share/helix/runtime/grammars/sources
endef

$(eval $(call BuildPackage,helix))
