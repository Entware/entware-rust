# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

# mips(el):
#	error: failed to run custom build command for `ring v0.16.20`

include $(TOPDIR)/rules.mk

PKG_NAME:=AdGuardian-Term
PKG_VERSION:=1.6.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Lissy93/AdGuardian-Term/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=0bc7671411372b7b1a4439ff8081c4ce28c4db2c32fe9fac38ae3177cd54fea4

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0431 ring-0175 reqwest-01121

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

# FIXME
# i386/x86_64:
#	undefined reference to `__stack_chk_guard'
ifeq ($(or $(CONFIG_i386),$(CONFIG_x86_64)),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/adguardian-term/install
	$(INSTALL_DIR) $(1)/opt/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/adguardian $(1)/opt/usr/bin
endef

$(eval $(call BuildPackage,adguardian-term))
