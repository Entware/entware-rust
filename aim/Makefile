# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=aim
PKG_VERSION:=1.8.5
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mihaigalos/aim/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=d27327538d4526e944400d3c425d7c4298725b60ddd1ca23d678f0dd3009b149

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

USE_CARGO_LOCK:=0

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0435

define Package/aim
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Download Manager
  TITLE:=A command line download/upload tool with resume
  URL:=https://github.com/mihaigalos/aim
  DEPENDS:=+libopenssl +zlib
endef

define Package/aim/description
  A command line download/upload tool with resume.
endef

# error: failed to run custom build command for `openssl-sys v0.9.87`
RUSTC_VARS += OPENSSL_NO_VENDOR=1

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/aim/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/aim $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,aim))
