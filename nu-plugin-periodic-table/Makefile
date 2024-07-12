# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2024 Entware

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-periodic-table
PKG_VERSION:=0.2.7
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-11-27
PKG_SOURCE_VERSION:=d534576a41cbe0ea4e7c51ee3c10d3ed945a86be
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.zst
PKG_SOURCE_URL:=https://github.com/JosephTLyons/nu_plugin_periodic_table
PKG_MIRROR_HASH:=feff13e2a75f44a30bd943c1c782941b8bd621184f17664bc399542b49a8755d

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=License.txt

include $(INCLUDE_DIR)/package.mk
include ../rustc-dev/cargo.mk

PKG_BUILD_DEPENDS += chrono-0435

define Package/nu-plugin-periodic-table
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin a periodic table of elements
  URL:=https://github.com/JosephTLyons/nu_plugin_periodic_table
  DEPENDS:=+nushell
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

ansi_blue="\033[1;34m"
ansi_white="\033[1;37m"
ansi_white_cur="\033[1;3;37m"
ansi_std="\033[0m"

printf "\n$$ansi_blue %s $$ansi_white %s $$ansi_std\n" "Info:" "to register (from inside Nushell):"
printf "\t$$ansi_white_cur%s $$ansi_std\n\n" "register /opt/usr/bin/nu_plugins/nu_plugin_periodic_table"
endef

$(eval $(call BuildPackage,nu-plugin-periodic-table))
