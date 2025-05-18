# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2025 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=rustscan
PKG_VERSION:=2.4.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/RustScan/RustScan/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=fa99c18a12d4c0939ab69ddb84ef7b85a1ea01d8fc86df227449d89473531765

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_UNPACK += --strip-components=1 -C $(PKG_BUILD_DIR)

define Package/rustscan
  SECTION:=net
  CATEGORY:=Network
  TITLE:=The Modern Port Scanner
  URL:=https://github.com/RustScan/RustScan
  EXTRA_DEPENDS:=nmap
endef

define Package/rustscan/description
  The Modern Port Scanner.
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/rustscan/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/rustscan $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,rustscan))
