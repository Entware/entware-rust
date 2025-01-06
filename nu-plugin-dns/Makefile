# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-dns
PKG_VERSION:=3.0.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/dead10ck/nu_plugin_dns
PKG_MIRROR_HASH:=7732d65379a6a769d9e28f7221725dfc7a7794165630cc1a6aae4ae85319f7f3

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0438 hickory-dns iana-time-zone-0161 quinn-0104

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

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_dns"
endef

$(eval $(call BuildPackage,nu-plugin-dns))
