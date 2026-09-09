# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=gitui
PKG_VERSION:=0.28.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/extrawurst/gitui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=0400cbf59605490b5fb8779f9af41fa4d7a1bb748093ca0e13156a5dff31c7aa

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0444 getrandom-0216 getrandom-034 iana-time-zone-0164 tui-textarea-070

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

# aarch64: error: failed to run custom build command for `sha1-asm v0.5.3`
ifeq ($(CONFIG_aarch64),y)
  TARGET_CFLAGS:=$(filter-out -mcpu%,$(TARGET_CFLAGS))
endif

define Package/gitui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/gitui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,gitui))
