# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024-2026 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-periodic-table
PKG_VERSION:=0.2.11
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/JosephTLyons/nu_plugin_periodic_table
PKG_MIRROR_HASH:=773da9c5f45c31ba07293a3eef6a5cf82f5d0c176cd5c55ab93468feb39ef30f

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=License.txt

NU_VERSION:=$(shell grep '^PKG_VERSION' ../nushell/Makefile | cut -d'=' -f2-)
NU_RELEASE:=$(shell grep '^PKG_RELEASE' ../nushell/Makefile | cut -d'=' -f2-)

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += \
	chrono-0440 getrandom-0216 iana-time-zone-0161 nushell

define Package/nu-plugin-periodic-table
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin a periodic table of elements
  URL:=https://github.com/JosephTLyons/nu_plugin_periodic_table
  EXTRA_DEPENDS:=nushell (=$(NU_VERSION)-$(NU_RELEASE))
endef

define Package/nu-plugin-periodic-table/description
  A periodic table of elements plugin for Nushell.
endef

ifneq ($(CONFIG_ARCH_64BIT),y)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/nu-plugin-periodic-table/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_periodic_table \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-periodic-table/postinst
#!/bin/sh

nu --commands "plugin add /opt/usr/bin/nu_plugins/nu_plugin_periodic_table"
endef

$(eval $(call BuildPackage,nu-plugin-periodic-table))
