# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-periodic-table
PKG_VERSION:=0.2.5
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-02-23
PKG_SOURCE_VERSION:=6ddec4ade0472dc9f5a7a5586936808ff6a21ce1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/JosephTLyons/nu_plugin_periodic_table
PKG_MIRROR_HASH:=a90fb7d0b68f759b59dc76665e707ffeb4b0b47c0579e13665705f9bdeabe6d5

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=License.txt

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-periodic-table
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin a periodic table of elements
  URL:=https://github.com/JosephTLyons/nu_plugin_periodic_table
  DEPENDS:=+nushell @BROKEN
endef

define Package/nu-plugin-periodic-table/description
  A periodic table of elements plugin for Nushell.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/nu-plugin-periodic-table/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_periodic_table \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-periodic-table/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_periodic_table'\n"
endef

$(eval $(call BuildPackage,nu-plugin-periodic-table))
