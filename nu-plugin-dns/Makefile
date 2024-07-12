# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-dns
PKG_VERSION:=2.0.1-alpha.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-04-28
PKG_SOURCE_VERSION:=0bf9085a52704df5c5630b424b1c096ab78fde12
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/dead10ck/nu_plugin_dns
PKG_MIRROR_HASH:=90e64c40fd579328537ab95d458933fecf7a954424678005214206aa0d1e19c7

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0435 hickory-dns quinn-0104

define Package/nu-plugin-dns
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A DNS utility for nushell
  URL:=https://github.com/dead10ck/nu_plugin_dns
  DEPENDS:=+nushell
endef

define Package/nu-plugin-dns/description
  Nushell plugin that does DNS queries and parses results into
  meaningful types.
endef

# x86_64: undefined reference to `__stack_chk_guard'
ifeq ($(CONFIG_x86_64),y)
RUSTFLAGS += $(if $(CONFIG_GCC_LIBSSP),-l dylib=ssp)
endif

define Package/nu-plugin-dns/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_dns \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-dns/postinst
#!/bin/sh

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_dns"
endef

$(eval $(call BuildPackage,nu-plugin-dns))
