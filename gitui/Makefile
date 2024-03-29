# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=gitui
PKG_VERSION:=0.24.3
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/extrawurst/gitui/tar.gz/refs/tags/v$(PKG_VERSION)?
PKG_HASH:=a5fc6b52a4db0037c3351b9743af49c8bb9ccff4dda5bdb064bab9e59f68fde2

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431

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

# FIXME
#	error: failed to run custom build command for `openssl-sys v0.9.87`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/gitui/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/gitui $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,gitui))
