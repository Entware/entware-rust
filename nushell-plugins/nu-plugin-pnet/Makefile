# SPDX-License-Identifier: WTFPL

include $(TOPDIR)/rules.mk

PKG_NAME:=nu-plugin-pnet
PKG_VERSION:=1.2.0
PKG_RELEASE:=4

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-07-27
PKG_SOURCE_VERSION:=fe459ab77b1810c638b305cc0bd688a99ffb042f
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_DATE).tar.xz
PKG_SOURCE_URL:=https://github.com/fdncred/nu_plugin_pnet
PKG_MIRROR_HASH:=e93d28e86630af7960f4a394d5eae4a60e2b73092ed973fcc95b54aa8f987216

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk
include ../../cargo.mk

define Package/nu-plugin-pnet
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Shells
  TITLE:=nu plugin to list system network interfaces
  URL:=https://github.com/fdncred/nu_plugin_pnet
  DEPENDS:=+nushell
endef

define Package/nu-plugin-pnet/description
  A nushell plugin for enumerating network interfaces in a platform-agnostic way.
endef

ifeq ($(or $(CONFIG_aarch64),$(CONFIG_i386),$(CONFIG_x86_64)),)
RUSTFLAGS += --cfg crossbeam_no_atomic_64
endif

define Package/nu-plugin-pnet/install
	$(INSTALL_DIR) $(1)/opt/usr/bin/nu_plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/nu_plugin_pnet \
		$(1)/opt/usr/bin/nu_plugins
endef

define Package/nu-plugin-pnet/postinst
#!/bin/sh

echo -e "\n\tTo register (from inside Nushell):\n"
echo -e "\t'register /opt/usr/bin/nu_plugins/nu_plugin_pnet'\n"
endef

$(eval $(call BuildPackage,nu-plugin-pnet))
