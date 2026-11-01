# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=AdGuardian-Term
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Lissy93/AdGuardian-Term/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=f99954da66aa25ee572af1de7b9c2a2337b13470ade3bfec21d357cdaa257f27

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0444 getrandom-0217 getrandom-034 iana-time-zone-0164

define Package/adguardian-term
  SECTION:=net
  CATEGORY:=Network
  TITLE:=real-time traffic monitoring and statistics for AGH
  URL:=https://github.com/Lissy93/AdGuardian-Term
  DEPENDS:=+libopenssl
endef

define Package/adguardian-term/description
  Terminal-based, real-time traffic monitoring and
  statistics for your AdGuard Home instance.
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
PKG_RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/adguardian-term/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/adguardian $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,adguardian-term))
