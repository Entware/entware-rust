# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-dns
PKG_VERSION:=4.0.3
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/dead10ck/nu_plugin_dns
PKG_MIRROR_HASH:=60532eac6550265238798863f1713ea5f4aab1bff5f0bc12230aff0c80eb7dbb

PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=LICENSE

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 getrandom-033 iana-time-zone-0161 nushell

define Package/nu-plugin-dns
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=A DNS utility for nushell
  URL:=https://github.com/dead10ck/nu_plugin_dns
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
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
