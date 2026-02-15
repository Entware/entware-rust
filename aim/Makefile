# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=aim
PKG_VERSION:=1.8.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mihaigalos/aim/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=d4c6fb9b57f0840e1220532e22bdd520d13aacb874dfaa67c6629a39cf8ce87b

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0440 getrandom-0215 getrandom-031 iana-time-zone-0161

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
