# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=gitui
PKG_VERSION:=0.26.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/extrawurst/gitui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=8075e180f3b01ff0c290b690488a7628c44b4de12346e04a77d823914a48918b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 tui-textarea-040

define Package/gitui
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Version Control Systems
  TITLE:=blazing fast terminal-ui for git
  URL:=https://github.com/extrawurst/gitui
  DEPENDS:=+libopenssl +zlib
  EXTRA_DEPENDS:=git
endef

define Package/gitui/description
  GitUI provides you with the comfort of a git GUI but right in your terminal.
endef

RUSTC_VARS += GITUI_RELEASE=1

# error: failed to run custom build command for `openssl-sys v0.9.102`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

define Package/gitui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/gitui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,gitui))
